//
//  HomeViewController.swift
//  ServerDataReceiver
//
//  Created by Konstantin Konstantinov on 10/7/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController, HomeView {

    lazy var viewModel = { HomeViewModel(view: self) }()

    @IBOutlet private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.startReceivingMessages()
    }

    func reloadData() {
        tableView.reloadData()
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard viewModel.messages.count > indexPath.row else { assert(false); return UITableViewCell() }

        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath)
        cell.textLabel?.text = viewModel.messages[indexPath.row].text

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
