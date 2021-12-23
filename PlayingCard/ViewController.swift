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
    
    // Card deck
    @IBOutlet var cardViews: [PlayingCardView]!
    
    // MARK: Private Properties
    private var deck = PlayingCardDeck()
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cards = [PlayingCard]()
        
        for _ in 1...((cardViews.count+1)/2) {
            let card = deck.draw()!
            cards += [card, card]
        }
        
        for cardView in cardViews {
            cardView.isFaceUp = true
            let card = cards.remove(at: cards.count.random)
            cardView.rank = card.rank.order
            cardView.suit = card.suit.rawValue
        }
        
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

