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
                
                // @note: isLast 로직이랑 Button을 ButtonView로 분리하고 싶어요..
                if isLast {
                    VStack {
                        Button(action: {
                            // @todo: 가이드 화면 띄우기
                            print("GuideView 실행")
                        }) {
                            HStack {
                                Spacer()
                                Text("만다라트가 뭔데?")
                                    .kerning(-0.3)
                                    .bold()
                                    .lineSpacing(1.2)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                        }
                        .frame(height: 48)
                        .background(Color(hex: "#00c25e"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                        Button(action: {
                            // @todo: 세부목표 작성 화면 전환
                            print("세부목표 작성 실행")
                        }) {
                            Text("좋아, 바로 해보자!")
                                .kerning(-0.3)
                                .bold()
                                .lineSpacing(1.2)
                                .font(.system(size: 16))
                        }
                        .frame(height: 48)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding([.leading, .trailing], 20)
                }
            }
        }
    }
}
