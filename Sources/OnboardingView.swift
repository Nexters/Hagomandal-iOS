//
//  OnboardingView.swift
//  Hagomandal
//
//  Created by toby.with on 2022/02/19.
//  Copyright © 2022 NxMachineCorps. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    @State private var index: Int = 0
    
    var titleArray = ["설마.. 내 목소리가 들리는거야?",
                      "우린 진정한 목표를 세워야하는\n순간에만 대화할 수 있는데..!",
                      "난 너야!\n진정한 목표를 찾고 있는\n네 마음의 소리지!",
                      "어떤 목표를 세워야할지,\n목표를 어떻게 이루어야할지\n고민하고 있지는 않아?",
                      "우리 함께 만다라트를 활용해\n목표를 세워보자!"]
    var imageArray = ["splash", "", "", "", ""]
    var boolArray = [false, false, false, false, true]
    
    var body: some View {
        ZStack {
            Color(hex: "#141414")
                .ignoresSafeArea()
            PageView(title: titleArray[index], smallImageName: imageArray[index], largeImageName: "", showOnboardingButton: boolArray[index])
                .onTapGesture {
                    if index < 4 {
                        index += 1
                        print(index)
                    }
                }
        }
    }
}
