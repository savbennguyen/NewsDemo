//
//  ViewControllerType.swift
//  Core
//
//  Created by Savvycom on 13/11/2022.
//

import Foundation

public protocol ViewControllerType: AnyObject {
    associatedtype ViewModelType
    
    func configViewModel(viewModel: ViewModelType)
    func setupViews()
    func bindViewModel()
}
