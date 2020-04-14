//
//  ContentView.swift
//  SwiftUIProgressBar
//
//  Created by Gualtiero Frigerio on 26/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var progressBarValue:CGFloat = 0
    
    var body: some View {
        VStack {
            ProgressBar(value: progressBarValue)
            CircularProgressBar(value: progressBarValue)
            CircularActivityIndicatory()
            KnightRider()
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                self.progressBarValue += 0.1
                if (self.progressBarValue >= 0.9) {
                    timer.invalidate()
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
