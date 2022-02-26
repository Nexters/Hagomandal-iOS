//
//  GuideView.swift
//  Hagomandal
//
//  Created by toby.with on 2022/02/25.
//  Copyright © 2022 NxMachineCorps. All rights reserved.
//

import SwiftUI

struct GuideView: View {
    var titleArray = ["만다라트는 목표 구체화에\n효과적인 발상기법이야!",
                     "핵심 목표 달성을 위한\n세부 목표 키워드를 정하고,",
                     "행동으로 옮기기 위한\n실천 목표를 세워보는거야!"]
    
    var body: some View {
        ZStack {
            Color(hex: "#141414")
                .ignoresSafeArea()
            TabView {
                PageView(title: titleArray[0], smallImageName: "", largeImageName: "guide0", showSkipButton: true)
                PageView(title: titleArray[1], smallImageName: "", largeImageName: "guide1", showSkipButton: true)
                PageView(title: titleArray[2], smallImageName: "", largeImageName: "guide2", showSkipButton: true)
            }
            .tabViewStyle(PageTabViewStyle())
        }
//        PageView(title: "자 그럼 만다라트를 활용해서\n목표를 세우러 가볼까?", smallImageName: "splash", largeImageName: "guide3", showGuideButton: true)
//        ButtonView(title: "좋아, 가보자!", hexColor: "#00c25e") {
//            //@todo: 온보딩6 화면 이동
//            print("온보딩6 화면 이동")
//        }
//        .padding([.leading, .trailing], 20)
    }
}
