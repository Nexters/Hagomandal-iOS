//
//  ButtonView.swift
//  Hagomandal
//
//  Created by toby.with on 2022/02/26.
//  Copyright © 2022 NxMachineCorps. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let hexColor: String
    var selectAction: () -> Void?
    
    var body: some View {
        Button(action: {
            selectAction()
        }) {
            HStack {
                Spacer()
                Text(title)
                    .kerning(-0.3)
                    .bold()
                    .lineSpacing(1.2)
                    .font(.system(size: 16))
                Spacer()
            }
        }
        .frame(height: 48)
        .background(Color(hex: hexColor))
        .foregroundColor(.white)
        .cornerRadius(8)
    }
}
