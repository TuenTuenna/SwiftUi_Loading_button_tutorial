//
//  ContentView.swift
//  LoadingButton
//
//  Created by Jeff Jeong on 2022/04/12.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoading : Bool = false
    
    var body: some View {
        VStack{
            
            Button(action: {
                Task {
                    withAnimation{isLoading = true}
                    try await Task.sleep(nanoseconds: 3_000_000_000)
                    withAnimation{isLoading = false}
                }
            }, label: {
                
                Group{
                    if isLoading {
                        ActivityIndicator()
                    } else {
                        Text("클릭")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                    }
                }
                .padding()
                .frame(width: 240, height: 80, alignment: .center)
            })
            .background(RoundedRectangle(cornerRadius: 16).strokeBorder(Color.white, lineWidth: 1.5))
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
