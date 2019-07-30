//
//  CircleProgressBar.swift
//  SwiftUIProgressBar
//
//  Created by Gualtiero Frigerio on 30/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct CircularProgressBar: View {
    @Binding var value:CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: value)
                .stroke(Color.green, lineWidth:5)
                .frame(width:100)
                .rotationEffect(Angle(degrees:-90))
            Text(getPercentage(value))
        }
    }
    
    func getPercentage(_ value:CGFloat) -> String {
        let intValue = Int(ceil(value * 100))
        return "\(intValue) %"
    }
}
