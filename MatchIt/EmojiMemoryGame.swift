//
//  EmojiMemoryGame.swift
//  MatchIt
//
//  Created by Yasin on 11.02.2022./Users/yasin/Desktop/MatchIt/MatchIt/MatchIt/EmojiMemoryGameView.swift
//
// ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🛩","🚗","🚁","🚑","🛵","🏎","🛸","🏍","🛴","🚀","⛵️","🚂","🛻","🚕","🚓","🚒","🚛","🚃","✈️","🚢","🚔","🚘","🚖","🚜"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 24) { pairIndex in EmojiMemoryGame.emojis[pairIndex] }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
