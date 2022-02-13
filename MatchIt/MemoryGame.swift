//
//  MemoryGame.swift
//  MatchIt
//
//  Created by Yasin on 11.02.2022.
//
// MODEL

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach({ cards[$0].isFaceUp = ($0 == newValue) }) }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatch = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatch].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatch].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
            //            print("chosenIndex is \(chosenIndex)")
        }
        //        print("ALL CARDS = \(cards)")
    }
    
    //REPLACED BY IF LEt ON CHOOSE FUNC
    //    func index(of card: Card) -> Int? {
    //        for index in 0..<cards.count {
    //            if cards[index].id == card.id {
    //                return index
    //            }
    //        }
    //        return nil
    //    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}


extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
