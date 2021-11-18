//
//  ViewController.swift
//  PlayingCard
//
//  Created by Sergey Lukaschuk on 31.05.2021.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...100 {
            if let card = deck.draw() {
                print(card)
            }
        }
    }
}

