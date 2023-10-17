//
//  ColorSliderView.swift
//  NewColorSlider
//
//  Created by Семен Выдрин on 17.10.2023.
//

import SwiftUI


struct ColorSliderView: View {
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack(spacing: 5) {
            Text("\(Int(value))").foregroundStyle(.white)
                .frame(width: 40, alignment: .leading)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(Color(color))
        }
    }
}

#Preview {
    ColorSliderView(value: .constant(175), color: .cyan)
}
