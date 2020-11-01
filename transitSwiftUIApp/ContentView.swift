//
//  ContentView.swift
//  transitSwiftUIApp
//
//  Created by Konstantin on 28.10.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var value = Double.random(in: 1...100)
    @State private var alert = false
    var alpha: Int = 1
    
    @State private var searchValue = Int.random(in: 1...100)
    
    var body: some View {
        VStack{
            Text("Move the slider as close as possible to: \(searchValue)")
                .padding()
            HStack{
                Text("0")
                ColorUISlider(value: $value,
                              searchValue: searchValue,
                              color: .blue,
                              alpha: computeScore())
                    .accentColor(Color(UIColor.blue))
                Text("100")
            }
            .padding()
            ButtonValue(title: "Check me", value: value, alert: $alert)
                .padding()
            Button("Repeat") {
                searchValue = Int.random(in: 1...100)
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(searchValue - Int(value))
        print(difference)
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(alpha: 1)
    }
}

