//
//  PenguinView.swift
//  The useless app
//
//  Created by Ng Qi An on 1/7/23.
//

import SwiftUI

struct PenguinView: View {
    var body: some View {
        Image("Penguin")
            .scaledToFit()
    }
}

struct PenguinView_Previews: PreviewProvider {
    static var previews: some View {
        PenguinView()
    }
}
