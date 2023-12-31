import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var stage = 0
    @State private var currentTool = 0
    @State private var showInstructions = true
    @State private var countTowardsJumpscare = 0
    @State private var player: AVAudioPlayer?
    @State private var playerJumpscare: AVAudioPlayer?
    @State private var hehehe = 0
    @State private var isSpinning = false
    
    
    var body: some View {
        VStack {
            if countTowardsJumpscare == 5 {
                withAnimation {
                    ZStack {
                        Color.black
                        Image("never gonna GIVE you up")
                            .resizable()
                            .frame(width: 800, height: 800)
                        VStack {
                            Spacer()
                                .padding()
                            Text("I tried to warn you...now its too late.")
                                .font(.title3)
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(.red)
                                .padding(10)
                            Button {
                                withAnimation {
                                    stage = 3
                                    countTowardsJumpscare = 0
                                    hehehe = 1
                                }
                            } label: {
                                Text("Click to continue")
                                    .bold()
                                    .padding()
                                    .background(.black)
                                    .foregroundColor(.red)
                                    .cornerRadius(10)
                                    .padding(20)
                            }
                        }
                        .padding()
                    }
                }
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
                    if hehehe == 0 {
                        Color(red: 0.847, green: 0.976, blue: 1.0)
                    } else if hehehe == 1 {
                        Image("never gonna GIVE you up")
                            .frame(width: 100, height: 100)
                            .rotationEffect(isSpinning ? Angle(degrees: 360) : .zero)
                            .animation(Animation.linear(duration: 3.0).repeatForever(autoreverses: false))
                            .onAppear {
                                isSpinning = true
                            }
                    }
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
                                    if countTowardsJumpscare == 5 {
                                        playSoundtrackJumpscare()
                                    }
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
                                    hehehe = 0
                                    if countTowardsJumpscare == 5 {
                                        playSoundtrack()
                                    }
                                    
                                }
                            } label: {
                                Image("Fist")
                                    .resizable()
                                    .frame(width: 50, height: 40)
                            }
                            Button {
                                stage = 0
                                countTowardsJumpscare = 0
                                hehehe = 0
                                if countTowardsJumpscare == 5 {
                                    playSoundtrack()
                                }
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
                                    hehehe = 0
                                    if countTowardsJumpscare == 5 {
                                        playSoundtrack()
                                    }
                                    
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
                                    hehehe = 0
                                    if countTowardsJumpscare == 5 {
                                        playSoundtrack()
                                    }
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
                                Text("Note: Click 5 times for special surprise.")
                                    .foregroundColor(.black)
                                    .padding()
                                Text("Note: Wait for the animation of the item to finish before clicking again for best experience.")
                                    .foregroundColor(.black)
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
        .onAppear {
            prepareSoundtrack()
        }
        .onAppear {
            prepareSoundtrackJumpscare() // Prepare the second soundtrack
        }
    }
    func prepareSoundtrack() {
        guard let url = Bundle.main.url(forResource: "hehe", withExtension: "mp3") else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
        } catch {
            print("Failed to load soundtrack.")
        }
    }
    func playSoundtrack() {
        player?.currentTime = 0
        player?.play()
    }
    func prepareSoundtrackJumpscare() {
        guard let url = Bundle.main.url(forResource: "Jumpscare", withExtension: "mp3") else {
            return
        }
        
        do {
            playerJumpscare = try AVAudioPlayer(contentsOf: url)
            playerJumpscare?.prepareToPlay()
        } catch {
            print("Failed to load jumpscare soundtrack.")
        }
    }
    
    func playSoundtrackJumpscare() {
        playerJumpscare?.currentTime = 0
        playerJumpscare?.play()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

