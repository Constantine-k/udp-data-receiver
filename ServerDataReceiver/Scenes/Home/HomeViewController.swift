//
//  HomeViewController.swift
//  ServerDataReceiver
//
//  Created by Konstantin Konstantinov on 10/7/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeView {

    lazy var viewModel = { HomeViewModel(view: self) }()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.startReceivingMessages()
    }

}
