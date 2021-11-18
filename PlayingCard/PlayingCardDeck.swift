//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Sergey Lukaschuk on 01.06.2021.
//

import Foundation


struct PlayingCardDeck {
    
    private(set) var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
            
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.random)
        } else {
            return nil
        }
    }
}
