//
//  ButtonValue.swift
//  transitSwiftUIApp
//
//  Created by Konstantin on 29.10.2020.
//

import SwiftUI

struct ButtonValue: View {
    let title: String
    let value: Double
    @Binding var alert: Bool
    
    var body: some View {
        Button("\(title)") {
            alert = true
        }.alert(isPresented: $alert) {
            Alert(
                title: Text("Your Score"),
                message: Text("\(lround(value))")
            )
        }
    }
}

struct ButtonValue_Previews: PreviewProvider {
    static var previews: some View {
        ButtonValue(title: "Check Me", value: 2, alert: .constant(false))
    }
}
