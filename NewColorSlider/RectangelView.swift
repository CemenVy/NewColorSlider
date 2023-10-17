//
//  RectangleView.swift
//  NewColorSlider
//
//  Created by Семен Выдрин on 17.10.2023.
//

import SwiftUI

struct RectangleView: View {
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 360, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .foregroundStyle(color)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 5)
            )
    }
}

#Preview {
    RectangleView(color: .red)
}
