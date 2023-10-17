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
    
    @State private var redSliderTextField = ""
    @State private var greenSliderTextField = ""
    @State private var blueSliderTextField = ""
    
    @State private var color: Color?
    
    var body: some View {
        VStack(spacing: 20) {
            RectangleView(color: color ?? .white)
            HStack{
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
                VStack (spacing: 8) {
                    TextFieldView(
                        value: "\(lround(redSliderValue))",
                        text: $redSliderTextField) {
                        updateValue(.red)
                    }
                    TextFieldView(
                        value: "\(lround(greenSliderValue))",
                        text: $greenSliderTextField) {
                        updateValue(.green)
                    }
                    TextFieldView(
                        value: "\(lround(blueSliderValue))",
                        text: $blueSliderTextField) {
                        updateValue(.blue)
                    }
                }
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
            green: greenSliderValue / 255,
            blue: blueSliderValue / 255
        )
    }
    
    private func updateValue(_ textField: ColorTextField) {
        
        withAnimation {
        switch textField {
        case .red:
            redSliderValue = Double(redSliderTextField) ?? 0
        case .green:
            greenSliderValue = Double(greenSliderTextField) ?? 0
        case .blue:
            blueSliderValue = Double(blueSliderTextField) ?? 0
        }
    }
        updateColor()
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension ContentView {
    enum ColorTextField {
        case red
        case green
        case blue
    }
}


#Preview {
    ContentView()
}




