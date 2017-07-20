//
//  ViewController.swift
//  2. tic tac toe
//
//  Created by Melanija Grunte on 13/07/2017.
//  Copyright © 2017 Melanija Grunte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game = GameState(count: 3)

    override func loadView() {
        view = UIView()
        view.backgroundColor = .black
    }

    override func viewDidAppear(_ animated: Bool) {
        update()
    }

    func update() {
        // update view from game state
        let tileWidth = view.frame.size.width/3
        let tileHeight = view.frame.size.height/3

        var currentHeight: CGFloat = 0
        var currentWidth: CGFloat = 0

        var posX = 0
        var posY = 0

        for row in game.state {
            for move in row {
                let tile = GameTile(
                    positionX: posX,
                    positionY: posY,
                    onDidTap: didTap,
                    move: move)

                view.addSubview(tile)
                tile.translatesAutoresizingMaskIntoConstraints = false
                tile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: currentWidth).isActive = true
                tile.topAnchor.constraint(equalTo: view.topAnchor, constant: currentHeight).isActive = true

                tile.widthAnchor.constraint(equalToConstant: tileWidth - 2).isActive = true
                tile.heightAnchor.constraint(equalToConstant: tileHeight - 2).isActive = true

                currentWidth += tileWidth
                posX += 1
            }
            posX = 0
            posY += 1
            currentWidth = 0
            currentHeight += tileHeight
        }
    }

    var player: Move = .playerX

    func didTap(posX: Int, posY: Int) {
        let success = game.addMove(row: posY, column: posX, move: player)
        if success {
        update()
            if case .playerX = player {
                player = .playerO
            } else {
                player = .playerX
            }
        }
    }
}

class GameTile: UIView {

    let move: Move?
    let positionX: Int
    let positionY: Int
    let onDidTap: (_ positionX: Int, _ positionY: Int) -> Void

    init(
        positionX: Int,
        positionY: Int,
        onDidTap: @escaping (_ positionX: Int, _ positionY: Int) -> Void,
        move: Move? = nil
    ) {
        self.positionX = positionX
        self.positionY = positionY
        self.onDidTap = onDidTap
        self.move = move
        super.init(frame: .zero)
        setupView()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(tapGesture)
    }

    func didTap() {
        onDidTap(positionX, positionY)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        backgroundColor = UIColor.white

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        if let move = move {
            label.text = move.symbol
        }
        label.font = UIFont.systemFont(ofSize: 40)

        addSubview(label)
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }
}
