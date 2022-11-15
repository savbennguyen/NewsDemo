//
//  NewsViewModel.swift
//  News
//
//  Created by Savvycom on 13/11/2022.
//

import Core
import RxSwift
import RxCocoa

class NewsViewModel: ViewModelType {
    var input: Input
    var output: Output
    // MARK: - Use Case
    private let getNewsUseCase = GetNewsUseCase()
    private let searchNewsUseCase = SearchNewsUseCase()
    private let disposeBag = DisposeBag()
    
    // MARK: - Observer
    private let onLoadingObserver = PublishSubject<Void>()
    private let onChangeObserver = BehaviorSubject<String?>(value: nil)
    private let onDisplayObservable = PublishSubject<[Article]>()
    private let onErrorObservable = PublishSubject<Error>()
    private let onNextObservable = PublishSubject<Article>()
    private let onRefreshObservable = PublishSubject<String>()
    
    // MARK: - Timer for searching
    private var timer: Timer?
    
    struct Input {
        var onLoading: AnyObserver<Void>
        var onChange: AnyObserver<String?>
        var onNext: AnyObserver<Article>
        var onRefresh: AnyObserver<String>
    }
    
    struct Output {
        var onDisplay: Observable<[Article]>
        var onError: Observable<Error>
        var onNext: Observable<Article>
        var onRefresh: Observable<String>
    }
    
    init() {
        input = Input(
            onLoading: onLoadingObserver.asObserver(),
            onChange: onChangeObserver.asObserver(),
            onNext: onNextObservable.asObserver(),
            onRefresh: onRefreshObservable.asObserver()
        )
        output = Output(
            onDisplay: onDisplayObservable.asObserver(),
            onError: onErrorObservable.asObserver(),
            onNext: onNextObservable.asObserver(),
            onRefresh: onRefreshObservable.asObserver()
        )
        observeInput()
    }
    
    private func observeInput() {
        disposeBag.insert([
            onLoadingObserver.subscribe(onNext: { [weak self] in
                self?.getNews()
            }),
            onChangeObserver
                .subscribe(onNext: { [weak self] query in
                    if query?.isEmpty == true {
                        self?.getNews()
                    } else {
                        self?.timer?.invalidate()
                        self?.timer = nil
                        self?.timer = Timer.scheduledTimer(withTimeInterval: 0.35, repeats: false, block: { _ in
                            self?.searchNews(query: query ?? "")
                        })
                    }
                }),
            onRefreshObservable
                .subscribe(onNext: { [weak self] query in
                    if query.isEmpty {
                        self?.getNews()
                    } else {
                        self?.searchNews(query: query)
                    }
                })
        ])
    }
    
    private func getNews() {
        getNewsUseCase
            .execute()
            .observe(on: MainScheduler.instance)
            .subscribe(on: SerialDispatchQueueScheduler.init(qos: .background))
            .subscribe(onNext: { [weak self] articles in
                self?.onDisplayObservable.onNext(articles.articles ?? [])
            }, onError: { [weak self] error in
                self?.onErrorObservable.onNext(error)
            })
            .disposed(by: disposeBag)
    }
    
    private func searchNews(query: String) {
        searchNewsUseCase
            .execute(param: query)
            .observe(on: MainScheduler.instance)
            .subscribe(on: SerialDispatchQueueScheduler.init(qos: .background))
            .subscribe(onNext: { [weak self] articles in
                self?.onDisplayObservable.onNext(articles.articles ?? [])
            }, onError: { [weak self] error in
                self?.onErrorObservable.onNext(error)
            })
            .disposed(by: disposeBag)
    }
}
