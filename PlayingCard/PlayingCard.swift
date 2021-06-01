//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Sergey Lukaschuk on 31.05.2021.
//

import Foundation


struct PlayingCard {
    
    var suit: Suit
    var Rank: Rank
    
    static var all: [Rank] {
        var allRanks: [Rank] = [.ace]
        for pips in 2...10 {
            allRanks.append(.numeric(pips))
        }
        allRanks += [.face("J"), .face("Q"), .face("K")]
        return allRanks
    }
    
    enum Suit: String {
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
        static var all = [Suit.spades, .hearts, .clubs, .diamonds]
    }

    enum Rank {
        case ace
        case face(String)
        case numeric(Int)
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default:
                return 0
            }
        }
    }
}













