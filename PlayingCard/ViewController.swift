//
//  ViewController.swift
//  PlayingCard
//
//  Created by Sergey Lukaschuk on 31.05.2021.
//

import UIKit

class ViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy: )))
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    // MARK: Private Properties
    private var deck = PlayingCardDeck()
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Private Methods
    @objc private func nextCard() {
        if let card = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    // MARK: IBActions
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended: playingCardView.isFaceUp.toggle()
        default: break
        }
    }
}

