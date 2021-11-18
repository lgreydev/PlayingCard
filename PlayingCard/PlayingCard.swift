//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Sergey Lukaschuk on 31.05.2021.
//

import Foundation


struct PlayingCard: CustomStringConvertible {
    
    var description: String { return "\(rank) \(suit)" }
    
    var suit: Suit
    var rank: Rank
    

    enum Suit: String, CustomStringConvertible {
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
        var description: String { return self.rawValue }
        static var all: [Suit] = [Suit.spades, .hearts, .clubs, .diamonds]
    }

    enum Rank: CustomStringConvertible {
        case ace
        case face(String)
        case numeric(Int)
        
        var description: String { return "\(self.order)" }
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
        static var all: [Rank] {
            var allRanks: [Rank] = [.ace]
            for pips in 2...10 {
                allRanks.append(.numeric(pips))
            }
            allRanks += [Rank.face("J"), .face("Q"), .face("K")]
            return allRanks
        }
    }
}

