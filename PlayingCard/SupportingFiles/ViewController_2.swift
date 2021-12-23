//
//  ViewController_2.swift
//  PlayingCard
//
//  Created by Sergey Lukaschuk on 24.12.2021.
//

import UIKit

class ViewController_2: UIViewController {

    // MARK: IBOutlets
    /// Card deck
    @IBOutlet var cardViews: [PlayingCardView]!
    
    // MARK: Private Properties
    private var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cards = [PlayingCard]()
        
        for _ in 1...((cardViews.count+1)/2) {
            let card = deck.draw()!
            cards += [card, card]
        }
        
        for cardView in cardViews {
            cardView.isFaceUp = false
            let card = cards.remove(at: cards.count.random)
            cardView.rank = card.rank.order
            cardView.suit = card.suit.rawValue
            cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flipCard(_:))))
        }
       
    }
    
    // MARK: Private Methods
    @objc private func flipCard(_ recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            if let chosenCardView = recognizer.view as? PlayingCardView {
                chosenCardView.isFaceUp.toggle()
            }
        default: break
        }
    }

}
