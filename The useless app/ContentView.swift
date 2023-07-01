//
//  ContentView.swift
//  The useless app
//
//  Created by Kevin De Baboon on 24/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var stage = 0
    @State private var currentTool = 0
    // Current tool is the tool that is currently being used.
    // 0 - No tool
    // 1 - Penknife
    // 2 - Fist
    // 3 - Knife
    // 4 - Shuriken
    // 5 - Nuke
    // 6 - Pan
    // The view will change to flicker an image first.
    @State private var showInstructions = true
    var body: some View {
        VStack {
            if stage == 0 {
                ZStack {
                    Color.white
                    VStack {
                        Spacer()
                        Text("Hello.")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                        Button("Click to continue"){
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                withAnimation {
                                    stage += 1
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    withAnimation {
                                        stage += 1
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        withAnimation {
                                            stage += 1
                                        }
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                }
            } else if stage == 1 || stage == 2 {
                Spacer()
                Text("Welcome.")
                    .font(stage == 1 ? .largeTitle : .title2)
                    .fontWeight(stage == 1 ? .bold : .regular)
                    .foregroundColor(stage == 1 ? .white : .gray)
                if stage == 2 {
                    Text("To this")
                        .font(.title)
                        .bold()
                    Text("Kick the Penguin")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.blue)
                    Text("app.")
                        .font(.title)
                        .bold()
                }
                Spacer()
            } else if stage == 3 {
                ZStack {
                    Color(red: 0.847, green: 0.976, blue: 1.0)
                    VStack {
                        Spacer()
                        HStack {
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.white)
                        
                    }.sheet(isPresented: $showInstructions){
                        showInstructions = false
                    } content: {
                        ZStack {
                            Color.white
                            VStack {
                                HStack {
                                    Image(systemName: "star.circle.fill")
                                        .font(.largeTitle)
                                        .bold()
                                    Text("Instructions")
                                        .font(.largeTitle)
                                        .bold()
                                }.padding()
                                Text("1. Use the tools at the bottom to run \"Experiments\" on the penguin.")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                Text("2. To restart the whole app, press the refresh icon.")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                Text("3. To end your current session, press the nuke.")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                Spacer()
                                Button {
                                    showInstructions = false
                                } label: {
                                    Text("OK")
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }.padding()
                            }.padding()
                        }
                        .ignoresSafeArea([.all])
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
            
        }
        .ignoresSafeArea([.all])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
