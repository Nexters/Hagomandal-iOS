//
//  PageView.swift
//  Hagomandal
//
//  Created by toby.with on 2022/02/25.
//  Copyright © 2022 NxMachineCorps. All rights reserved.
//

import SwiftUI

struct PageView: View {
    var title: String
    
    var smallImageName: String
    private var smallImage: Image? {
        Image(smallImageName)
    }
    var largeImageName: String
    private var largeImage: Image? {
        Image(largeImageName)
    }
    
    var showOnboardingButton: Bool?
    var showSkipButton: Bool?
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            smallImage?
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            
            Text(title)
                .kerning(-0.3)
                .bold()
                .lineSpacing(1.5)
                .foregroundColor(.white)
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
                .padding()
            
            largeImage
            
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
            
            if showSkipButton ?? false {
                ZStack(alignment: .bottomTrailing) {
                    HStack {
                        Spacer()
                        Button(action: {
                            //@todo: 가이드4 화면 이동
                            print("가이드4 화면 이동")
                        }) {
                            Text("SKIP")
                                .bold()
                                .foregroundColor(Color(hex: "#00c25e"))
                        }
                        .padding([.trailing, .bottom], 15)
                    }
                }
            }
        }
    }
}
