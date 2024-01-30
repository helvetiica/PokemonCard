//
//  ContentView.swift
//  Pokemon Card
//
//  Created by Vinoth Ragunathan on 2024-01-27.
//

import SwiftUI

struct ContentView: View {
    @State var ValueTranslation : CGSize = .zero
    @State var isDragging = false
    var body: some View {
        ZStack{
            Image("cardbg").resizable().scaledToFill()
                .frame(width: 316, height: 417)
                .overlay(
                    Rectangle()
                        .frame(width: 300, height: 50)
                    // Remove .colorInvert() if it displays the 'shine' in dark shade on device
                        .colorInvert()
                        .blur(radius: 50)
                        .offset(x: -ValueTranslation.width / 1.5, y: -ValueTranslation.height / 1.5)
                    
                )
                .clipped()
            Image("charizard").resizable().scaledToFill()
                .offset(x: 20, y: -70)
                .frame(width: 160, height: 160)
                .offset(x: ValueTranslation.width / 30, y: ValueTranslation.height / 30)
            
        }
        
        .frame(width: 1000, height: 1000)
        .background(.black)
        
        .rotation3DEffect(
            .degrees(isDragging ? 10 : 0),
            axis: (x: -ValueTranslation.height, y: ValueTranslation.width, z: 0.0)
        )
        .gesture(DragGesture()
            .onChanged({ value in
                withAnimation {
                    ValueTranslation = value.translation
                    isDragging = true
                }
            })
                .onEnded({ vaule in
                    withAnimation {
                        ValueTranslation = .zero
                        isDragging = false
                    }
                })
        )
    }
}

#Preview {
    ContentView()
}
