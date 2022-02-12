//
//  ContentView.swift
//  MatchIt
//
//  Created by Yasin on 9.02.2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🛩","🚗","🚁","🚑","🛵","🏎","🛸","🏍","🛴","🚀","⛵️","🚂","🛻","🚕","🚓","🚒","🚛","🚃","✈️","🚢","🚔","🚘","🚖","🚜"].shuffled()
    @State var emojiCount = 20
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum:90))]) {
                        ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                    .foregroundColor(.red)
                }
                .navigationTitle("MatchIT")
//                Spacer()
//                HStack {
//                    remove
//                    Spacer()
//                    add
//                }
                .font(.largeTitle)
                .padding(.horizontal)
            }
            .padding(.horizontal)
        }
    }
//    var remove: some View {
//        Button {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//        }
//    }
//    var add: some View {
//        Button {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }
    
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
