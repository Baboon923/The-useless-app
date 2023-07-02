import SwiftUI

struct ContentView: View {
    @State private var stage = 0
    @State private var currentTool = 0
    // Current tool is the tool that is currently being used.
    // 0 - No tool
    // 1 - Penknife
    // 2 - Fist
    // 3 - Knife
    // 4 - Nuke
    // The view will change to flicker an image first.
    @State private var showInstructions = true
    @State private var countTowardsJumpscare = 0
    
    var body: some View {
        VStack {
            if countTowardsJumpscare == 5 {
                Image("Jumpscare")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
            } else if stage == 0 {
                ZStack {
                    Color.white
                    VStack {
                        Spacer()
                        Text("Hello.")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                        Button("Click to continue") {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                withAnimation {
                                    stage += 1
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    withAnimation {
                                        stage += 1
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                        withAnimation {
                                            stage += 1
                                        }
                                    }
                                }
                            }
                        }
                        .buttonStyle(.borderedProminent)
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
                    
                    Spacer()
                    
                    Text("Warning: This app is not for the faint of heart...")
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.red)
                }
                Spacer()
            } else if stage == 3 {
                ZStack {
                    Color(red: 0.847, green: 0.976, blue: 1.0)
                    VStack {
                        Spacer()
                        if currentTool == 0 {
                            PenguinView()
                        } else if currentTool == 1 {
                            PenKnifePenguinView()
                        } else if currentTool == 2 {
                            PunchPenguinView()
                        } else if currentTool == 3 {
                            KnifePenguinView()
                        } else if currentTool == 4 {
                            NukePenguinView()
                        }
                        Spacer()
                        HStack {
                            Button {
                                currentTool = 1
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    currentTool = 0
                                    countTowardsJumpscare += 1
                                }
                            } label: {
                                Image("Penknife")
                                    .resizable()
                                    .frame(width: 60, height: 50)
                            }
                            Button {
                                currentTool = 2
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    currentTool = 0
                                    countTowardsJumpscare += 1
                                }
                            } label: {
                                Image("Fist")
                                    .resizable()
                                    .frame(width: 50, height: 40)
                            }
                            Button {
                                stage = 0
                                countTowardsJumpscare = 0
                            } label: {
                                Image("Refresh")
                                    .resizable()
                                    .frame(width: 50, height: 40)
                            }
                            Button {
                                currentTool = 3
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    currentTool = 0
                                    countTowardsJumpscare += 1
                                }
                            } label: {
                                Image("Knife")
                                    .resizable()
                                    .frame(width: 50, height: 40)
                            }
                            Button {
                                currentTool = 4
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    currentTool = 0
                                    countTowardsJumpscare += 1
                                }
                            } label: {
                                Image("Nuke")
                                    .resizable()
                                    .frame(width: 50, height: 40)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.gray)
                    }
                    .sheet(isPresented: $showInstructions) {
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
                                }
                                .padding()
                                Text("1. Use the tools at the bottom to run \"Experiments\" on the penguin.")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                Text("2. To restart the whole app, press the refresh icon.")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                Text("3. To restart your current session, press the restart button.")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                Spacer()
                                Text("Last chance to change your mind... I'm warning you...")
                                    .font(.title)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.red)
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
                                }
                                .padding()
                            }
                            .padding()
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
