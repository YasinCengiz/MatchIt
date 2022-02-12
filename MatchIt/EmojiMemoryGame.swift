//
//  EmojiMemoryGame.swift
//  MatchIt
//
//  Created by Yasin on 11.02.2022./Users/yasin/Desktop/MatchIt/MatchIt/MatchIt/ContentView.swift
//
// ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🛩","🚗","🚁","🚑","🛵","🏎","🛸","🏍","🛴","🚀","⛵️","🚂","🛻","🚕","🚓","🚒","🚛","🚃","✈️","🚢","🚔","🚘","🚖","🚜"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in EmojiMemoryGame.emojis[pairIndex] }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
