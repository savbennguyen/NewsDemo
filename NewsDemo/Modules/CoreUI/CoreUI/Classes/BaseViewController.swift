//
//  BaseViewController.swift
//  CoreUI
//
//  Created by Savvycom on 13/11/2022.
//

import Foundation
import Core

open class BaseViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open func showLoading() { }
    
    open func hideLoading() { }
    
    open func showError(error: Error, handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: "Oops! Something went wrong...", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Try again", style: .default, handler: handler)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
