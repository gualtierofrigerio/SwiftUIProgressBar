//
//  ProgressBar.swift
//  SwiftUIProgressBar
//
//  Created by Gualtiero Frigerio on 26/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct ProgressBarWithRelativeWidth: View {
    @Binding var value:Length
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Progress: \(value)")
            ZStack {
                Rectangle()
                    .opacity(0.1)
                Rectangle()
                    .relativeWidth(value)
                    .frame(minWidth:0, idealWidth:value, maxWidth: .infinity, alignment: .leading)
                    .opacity(0.5)
                    .animation(.default)
            }
            .frame(height:10)
        }
    }
}

struct ProgressBar: View {
    @Binding var value:Length
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .trailing) {
                Text("Progress: \(self.getPercentage(self.value))")
                ZStack(alignment: .leading) {
                    Rectangle()
                        .opacity(0.1)
                    Rectangle()
                        .frame(minWidth: 0, idealWidth:self.getProgressBarWidth(geometry: geometry),
                               maxWidth: self.getProgressBarWidth(geometry: geometry))
                        .opacity(0.5)
                        .background(Color.yellow)
                        .animation(.default)
                }
                .frame(height:10)
            }.frame(height:10)
        }
    }
    
    func getProgressBarWidth(geometry:GeometryProxy) -> Length {
        let frame = geometry.frame(in: .global)
        return frame.size.width * value
    }
    
    func getPercentage(_ value:Length) -> String {
        let intValue = Int(ceil(value * 100))
        return "\(intValue) %"
    }
}
