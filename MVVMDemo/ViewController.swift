//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Saim Zahid on 2020-11-20.
//

import UIKit
/**
 Research Combine (view binding) RXswift? KVO?
 View controller
 
 Datasource
 
 protocol GenericViewRendering (over kill)
 GenericViewModel (should take service to get datasource)
 
 GenericView
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewModel: GenericViewRendering = GenericViewModel(names: ["Messi", "Lampard", "Drogba"])
        let genericView = GenericView(frame: .zero, viewModel: viewModel)
        self.view = genericView
    }
}

