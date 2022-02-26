//
//  PageView.swift
//  Hagomandal
//
//  Created by toby.with on 2022/02/25.
//  Copyright © 2022 NxMachineCorps. All rights reserved.
//

import SwiftUI

struct PageView: View {
    @State private var isLast: Bool = false
    @Binding var index: Int
    
    var logoName: String
    var logoImage: Image? {
        Image(logoName)
    }
    var text: String
    var guideName: String
    var guideImage: Image? {
        Image(guideName)
    }
    
    var body: some View {
       
        ZStack {
            Color(hex: "#141414")
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Spacer()
                
                logoImage?
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                
                Text(text)
                    .kerning(-0.3)
                    .bold()
                    .lineSpacing(1.5)
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                    .padding()
                
                guideImage
                
                Spacer()
                
                if showOnboardingButton ?? false {
//                    NavigationView {
//                        NavigationLink(destination: GuideView()) {
//                            ButtonView(title: "만다라트가 뭔데?", hexColor: "#00c25e") {
//                                print("가이드1 화면 이동")
//                            }
//                            .padding([.leading, .trailing], 20)
//                        }
//                    }
                    ButtonView(title: "만다라트가 뭔데?", hexColor: "#00c25e") {
                        //@todo: 가이드1 화면 이동
                        print("가이드1 화면 이동")
                    }
                    .padding([.leading, .trailing], 20)
                    
                    ButtonView(title: "좋아, 바로 해보자!", hexColor: "#141414") {
                        //@todo: 온보딩6 화면 이동
                        print("온보딩6 화면 이동")
                    }
                    .padding([.leading, .trailing], 20)
                }
                
                if showGuideButton ?? false {
                    ButtonView(title: "좋아, 가보자!", hexColor: "#00c25e") {
                        //@todo: 온보딩6 화면 이동
                        print("온보딩6 화면 이동")
                    }
                    .padding([.leading, .trailing], 20)
                }
            }
        }
    }
}
