//
//  CircularActivityIndicatory.swift
//  SwiftUIProgressBar
//
//  Created by Gualtiero Frigerio on 30/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct CircularActivityIndicatory: View {
    
    @State var spinCircle = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(Color.blue, lineWidth:4)
                .frame(width:100)
                .rotationEffect(.degrees(spinCircle ? 0 : -360), anchor: .center)
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
        }
        .onAppear {
            self.spinCircle = true
        }
    }
}

#if DEBUG
struct CircularActivityIndicatory_Previews: PreviewProvider {
    static var previews: some View {
        CircularActivityIndicatory()
    }
}
#endif
