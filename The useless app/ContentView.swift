//
//  ContentView.swift
//  The useless app
//
//  Created by Kevin De Baboon on 24/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var color = Color.white
    @State private var text = "Hello"
    var body: some View {
        ZStack {
            color
                .ignoresSafeArea(.all)
            VStack {
                Text(text)
                    .foregroundColor(.black)
            }
            .padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
