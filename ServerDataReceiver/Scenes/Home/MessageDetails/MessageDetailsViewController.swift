//
//  MessageDetailsViewController.swift
//  ServerDataReceiver
//
//  Created by Konstantin Konstantinov on 10/15/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import UIKit

final class MessageDetailsViewController: UIViewController {

    var model: MessageDetailsModel?

    @IBOutlet private var timestampLabel: UILabel!
    @IBOutlet private var messageTextLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
    }

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }

}

// MARK: - Private

private extension MessageDetailsViewController {
    func setupAppearance() {

        timestampLabel.text = model?.timestampString
        messageTextLabel.text = model?.messageText
    }
}
