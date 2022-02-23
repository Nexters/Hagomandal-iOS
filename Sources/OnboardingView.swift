//
//  OnboardingView.swift
//  Hagomandal
//
//  Created by toby.with on 2022/02/19.
//  Copyright © 2022 NxMachineCorps. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isLast: Bool = false
    @State private var index: Int = 0
    
    var textArray = ["설마.. 내 목소리가 들리는거야?",
                     "우린 진정한 목표를 세워야하는\n순간에만 대화할 수 있는데..!",
                     "난 너야!\n진정한 목표를 찾고 있는\n네 마음의 소리지!",
                     "어떤 목표를 세워야할지,\n목표를 어떻게 이루어야할지\n고민하고 있지는 않아?",
                     "우리 함께 만다라트를 활용해\n목표를 세워보자!"]
    
    var body: some View {
//        let isLast = (index == 4) ? true : false
        
        PageView(image: "splash", text: textArray[index])
            .onTapGesture {
                // 다음 화면으로 이동
                index = index + 1
                print("index", index)
                
//                ButtonView.hidden(isLast ? true : false)
                ButtonView {
                    self.isLast = true
                }
                    .opacity(isLast ? 0 : 1)
            }
        
        //            if isLast {
        //            }
        //        TabView {
        //            PageView(image: "splash", text: "설마.. 내 목소리가 들리는거야?")
        //            PageView(text: "우린 진정한 목표를 세워야하는\n순간에만 대화할 수 있는데..!")
        //            PageView(text: "난 너야!\n진정한 목표를 찾고 있는\n네 마음의 소리지!")
        //            PageView(text: "어떤 목표를 세워야할지,\n목표를 어떻게 이루어야할지\n고민하고 있지는 않아?")
        //            PageView(text: "우리 함께 만다라트를 활용해\n목표를 세워보자!")
        //        }
    }
}

struct ButtonView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("Delete tapped!")
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
                print("Delete tapped!")
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

struct PageView: View {
    var image: String?
    var text: String
    
    var body: some View {
        ZStack {
            Color(hex: "#141414")
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Spacer()
                
                Image(systemName: image ?? "")
                
                Text(text)
                    .kerning(-0.3)
                    .bold()
                    .lineSpacing(1.5)
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
