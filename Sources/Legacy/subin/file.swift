//
//  ContentView.swift
//  SUMandartTest
//
//  Created by 최동규 on 2022/01/29.
//

import SwiftUI
struct CardView: View {
    let backgroundColor: Color
    @State var text: String = ""
    var focusField: FocusState<Int?>.Binding
    let identifier: Int
    var body: some View {
        backgroundColor
            .cornerRadius(16)
            .overlay(
                VStack {
                    HStack {
                        TextEditor(text: $text)
                            .foregroundColor(.white)
                            .focused(focusField, equals: identifier)
                            .overlay {
                                if text.isEmpty && focusField.wrappedValue != identifier {
                                    HStack {
                                        VStack {
                                            Text("세부목표")
                                                .foregroundColor(.gray)
                                                .allowsHitTesting(false)

                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                }   else {
                                    EmptyView()
                                }
                            }
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text("\(text.count)/12")
                            .font(.system(size: 12))
                        Spacer()
                    }
                }
                    .padding(EdgeInsets(top: 16, leading: 20, bottom: 20, trailing: 20))
            )
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .cornerRadius(16)
    }
}


extension UIColor {
    convenience init?(hexString: String) {
        var hex = hexString
        if hex.first == "#" {
            hex.removeFirst()
        }

        var hexValue: UInt32 = 0
        guard Scanner(string: hex).scanHexInt32(&hexValue) else {
            return nil
        }

        let r, g, b, a, divisor: CGFloat

        if hex.count == 6 {
            divisor = 255
            r = CGFloat((hexValue & 0xFF0000) >> 16) / divisor
            g = CGFloat((hexValue & 0x00FF00) >> 8) / divisor
            b = CGFloat( hexValue & 0x0000FF) / divisor
            a = 1
        } else if hex.count == 8 {
            divisor = 255
            a = CGFloat((hexValue & 0xFF000000) >> 24) / divisor
            r = CGFloat((hexValue & 0x00FF00) >> 16) / divisor
            g = CGFloat((hexValue & 0x00FF00) >> 8) / divisor
            b = CGFloat((hexValue & 0x0000FF)) / divisor
        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
struct ContentView: View {
    private let spacing: CGFloat = 40
    private let cardHeight: CGFloat = 140
    @FocusState private var focusField: Int?
    var body: some View {
        ZStack {
            Color(UIColor(hexString: "#202532") ?? .darkGray)

            CardView(backgroundColor: .init(UIColor(hexString: "#5533c0") ?? .darkGray), focusField: $focusField, identifier: 0)
                .offset(x: 0, y:  0 * spacing)
                .frame(height: cardHeight, alignment: .center)
            CardView(backgroundColor: .init(UIColor(hexString: "#35ace4") ?? .darkGray), focusField: $focusField, identifier: 1)
                .offset(x: 0, y:  1 * spacing + (focusField == 0 ? cardHeight : 0))
                .frame(height: cardHeight, alignment: .center)
            CardView(backgroundColor: .init(UIColor(hexString: "#09c6a6") ?? .darkGray), focusField: $focusField, identifier: 2)
                .offset(x: 0, y: 2 * spacing + ((focusField ?? 99 < 2) ? cardHeight : 0))
                .frame(height: cardHeight, alignment: .center)
            CardView(backgroundColor: .init(UIColor(hexString: "#f3c403") ?? .darkGray), focusField: $focusField, identifier: 3)
                .offset(x: 0, y: 3 * spacing + ((focusField ?? 99 < 3) ? cardHeight : 0))
                .frame(height: cardHeight, alignment: .center)
        }

        .animation(.easeInOut(duration: 0.3))
    }
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

