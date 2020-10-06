//
//  ButtonView.swift
//  learn-SwiftUI-animation
//
//  Created by Jenny Li on 10/6/20.
//

import SwiftUI

struct ButtonView: View {
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        Button("Tap Me") {
                    self.animationAmount += 1
                }
                .padding(50)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
//                .scaleEffect(animationAmount)
                .rotationEffect(.degrees(5))
                    
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatCount(10, autoreverses: true).repeatForever()
                )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
