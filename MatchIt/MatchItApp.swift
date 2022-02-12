//
//  MatchItApp.swift
//  MatchIt
//
//  Created by Yasin on 9.02.2022.
//

import SwiftUI

@main
struct MatchItApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
