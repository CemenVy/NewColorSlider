//
//  ContentView.swift
//  NewColorSlider
//
//  Created by Семен Выдрин on 17.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @State private var color: Color?
    
    var body: some View {
        VStack(spacing: 20) {
            RectangleView(color: color ?? .white)
            VStack {
                ColorSliderView(value: $redSliderValue, color: .red)
                    .onChange(of: redSliderValue, {
                        updateColor()
                    })
                ColorSliderView(value: $greenSliderValue, color: .green)
                    .onChange(of: greenSliderValue, {
                        updateColor()
                    })
                ColorSliderView(value: $blueSliderValue, color: .blue)
                    .onChange(of: blueSliderValue, {
                        updateColor()
                    })
            }
            Spacer()
        }
        .padding()
        .onAppear {
            updateColor()
        }
    }
    
    private func updateColor() {
        color = Color(
            red: redSliderValue / 255,
            green: greenSliderValue / 255 ,
            blue: blueSliderValue / 255
        )
    }
}

#Preview {
    ContentView()
}


