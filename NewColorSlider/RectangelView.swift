//
//  RectangleView.swift
//  NewColorSlider
//
//  Created by Семен Выдрин on 17.10.2023.
//

import SwiftUI

struct RectangleView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red / 255, green: green / 255, blue: blue / 255)
            .clipShape(.rect(cornerRadius: 20))
            .frame(height: 130)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.white, lineWidth: 4)
            )
    }
}

struct Rectangle_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView(red: 100, green: 100, blue: 100)
    }
}

