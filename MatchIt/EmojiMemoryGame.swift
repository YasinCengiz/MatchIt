//
//  EmojiMemoryGame.swift
//  MatchIt
//
//  Created by Yasin on 11.02.2022./Users/yasin/Desktop/MatchIt/MatchIt/MatchIt/ContentView.swift
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🛩","🚗","🚁","🚑","🛵","🏎","🛸","🏍","🛴","🚀","⛵️","🚂","🛻","🚕","🚓","🚒","🚛","🚃","✈️","🚢","🚔","🚘","🚖","🚜"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in EmojiMemoryGame.emojis[pairIndex] }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
