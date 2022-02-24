//
//  GuideView.swift
//  Hagomandal
//
//  Created by toby.with on 2022/02/25.
//  Copyright © 2022 NxMachineCorps. All rights reserved.
//

import SwiftUI

struct GuideView: View {
    @State private var index: Int = 0
    @Binding var isLast: Bool
    
    var logoArray = ["", "", "", "splash"]
    var textArray = ["만다라트는 목표 구체화에\n효과적인 발상기법이야!",
                     "핵심 목표 달성을 위한\n세부 목표 키워드를 정하고,",
                     "행동으로 옮기기 위한\n실천 목표를 세워보는거야!",
                     "자 그럼 만다라트를 활용해서\n목표를 세우러 가볼까?"]
    
    var body: some View {
        PageView(index: $index, logoName: logoArray[index], text: textArray[index], guideName: "guide\(index)")
            .onTapGesture {
                if index < 3 {
                    index += 1
                    print(index)
                }
                
                isLast = (index == 4 ? true : false)
            }
    }
}
