//
//  NewsDetailViewController.swift
//  News
//
//  Created by Savvycom on 13/11/2022.
//

import UIKit
import CoreUI
import SDWebImage
import RxSwift

class NewsDetailViewController: BaseViewController {
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var sourceLabel: UIButton!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsPublishedAtLabel: UILabel!
    @IBOutlet weak var newsContentLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    private let disposeBag = DisposeBag()
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        observe()
    }
    
    private func setupViews() {
        newsImageView.sd_setImage(with: URL(string: article.urlToImage ?? ""), placeholderImage: UIImage(named: "news_thumbnail", in: Bundle(for: NewsDetailViewController.self), compatibleWith: nil), options: .continueInBackground) { _,_,_,_ in
        }
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(openSourceUrl))
        sourceLabel.isUserInteractionEnabled = true
        sourceLabel.addGestureRecognizer(tapGesture)
        newsTitleLabel.text = article.title
        let date = (article.publishedAt ?? "").date(format: "yyyy-MM-dd'T'HH:mm:ssZ") ?? Date()
        newsPublishedAtLabel.text = date.string(format: "dd MMM yyyy, HH:mm:ss")
        newsContentLabel.text = article.content
    }
    
    private func observe() {
        backButton
            .rx
            .tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    @objc func openSourceUrl() {
        guard let url = URL(string: article.url ?? "") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
