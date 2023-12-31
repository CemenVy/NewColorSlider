//
//  ContentView.swift
//  NewColorSlider
//
//  Created by Семен Выдрин on 17.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255).rounded()
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var blue = Double.random(in: 0...255).rounded()
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        /* ZStack для модификатора .onTapGesture, Без использования ZStack область жестов ограничивается вертикальным стеком, который
         заканчивается сразу после слайдеров */
        ZStack {
            VStack(spacing: 40) {
                RectangleView(red: red, green: green, blue: blue)
                
                VStack {
                    ColorSliderView(value: $red, color: .red)
                    ColorSliderView(value: $green, color: .green)
                    ColorSliderView(value: $blue, color: .blue)
                }
                .frame(height: 150)
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
                Spacer()
            }
        }
        .padding()
        .background(Color.orange)
        .onTapGesture {
            isInputActive = false
        }
    }
}



#Preview {
    ContentView()
}




