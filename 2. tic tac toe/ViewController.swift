//
//  ViewController.swift
//  2. tic tac toe
//
//  Created by Melanija Grunte on 13/07/2017.
//  Copyright © 2017 Melanija Grunte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.black

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("World", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(ViewController.tap), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 87)
        return button
    }()

    func tap() {
        button.setTitle("Mela", for: .normal)
    }
}

class GameSpaceView: UIView {

    let move: Move?

    init(move: Move? = nil) {
        self.move = move
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {

    }

}
