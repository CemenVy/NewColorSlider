//
//  TextFieldView.swift
//  NewColorSlider
//
//  Created by Семен Выдрин on 17.10.2023.
//

import SwiftUI

struct TextFieldView: View {
    let value: String
    @Binding var text: String
    @FocusState var isInputActive: Bool
    var onCommit: () -> Void
    
    var body: some View {
        TextField(value, text: $text)
            .textFieldStyle(.roundedBorder)
            .frame(width: 45)
            .multilineTextAlignment(.trailing)
            .keyboardType(.decimalPad)
        }

}

