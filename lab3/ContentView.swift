//
//  ContentView.swift
//  lab3
//
//  Created by vashka on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["😄", "😅", "🤒", "😱", "😡", "🤩", "👽", "👽", "😄", "😅", "🤒", "😱", "😡", "🤩", "👽", "👽", "🤒", "😱", "😡", "🤩", "👽", "👽", "😄", "😅", "🤒", "😱", "😡", "🤩", "👽", "👽"]

    
    @State var cardCount = 8
    var isEnabled: Bool = true
    @State var colorScheme: Color = .blue
    var body: some View {
        VStack{
            ScrollView{
                Text("Memo").font(.largeTitle)
                cardDisplay(elems: emojis, itemsCount: cardCount, minWidthSize: 80, themeColor: colorScheme)
            }
            BtnList
            
            
        }.padding()
        
    }
    
    var BtnList: some View {
        HStack{
            ButtonTheme(iconImage: "smiley", iconText: "Motyw 1", btnColor: colorScheme).onTapGesture {
                changeCardScheme(scheme: .blue)}
            Spacer()
            ButtonTheme(iconImage: "arrow.down.left.arrow.up.right.circle", iconText: "Motyw 2", btnColor: colorScheme).onTapGesture {
                changeCardScheme(scheme: .red)
            }
            Spacer()
            ButtonTheme(iconImage: "person.3", iconText: "Motyw 3", btnColor: colorScheme).onTapGesture {
                changeCardScheme(scheme: .green)
            }
        }
    }
    
    
    func cardDisplay(elems: Array<String>, itemsCount: Int, minWidthSize: CGFloat, themeColor: Color?) -> some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: minWidthSize ))]){
            ForEach(0..<itemsCount, id: \.self){
                index in
                CardView(content: elems[index]).aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(themeColor)
        
    }
    
    func changeCardScheme(scheme: Color){
        let randomInt = Int.random(in: 4..<emojis.count)
        colorScheme = scheme
        cardCount = randomInt
    }
    
//    var cardsCountAdjuster: some View {
//        HStack{
//            adjustCardNumber(by: -2, symbol: "minus.rectangle").disabled(cardCount - 2 < 2)
//            Spacer()
//            adjustCardNumber(by: +2, symbol: "plus.rectangle").disabled(cardCount + 2 > emojis.count)
//
//        }
//    }
//
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        Button(action: {
            let newCount = cardCount + offset
            if(newCount >= 2 && newCount <= emojis.count){
                cardCount = newCount
                
            }
        }, label: {
            Label("", systemImage: symbol)
        }).font(.largeTitle)
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
