//
//  ActivityIndicator.swift
//  LoadingButton
//
//  Created by Jeff Jeong on 2022/04/12.
//

import SwiftUI

struct ActivityIndicator: View {
    
    @State var currentDegrees = 0.0
    
    let yellowGradient = LinearGradient(gradient: Gradient(colors: [
        Color.yellow,
        Color.yellow.opacity(0.75),
        Color.yellow.opacity(0.5),
        Color.yellow.opacity(0.2),
        .clear
    ]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.8)
            .stroke(yellowGradient, style: StrokeStyle(lineWidth: 5, lineCap: .round))
            .frame(width: 40, height: 40)
            .rotationEffect(Angle(degrees: currentDegrees))
            .onAppear(perform: {
                Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true, block: { _ in
                    withAnimation{self.currentDegrees += 5}
                })
            })
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
