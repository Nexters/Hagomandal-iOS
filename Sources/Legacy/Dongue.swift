//import SwiftUI
//struct DG_CardView: View {
//    let backgroundColor: Color
//    @State var text: String = ""
//    var focusField: FocusState<Int?>.Binding
//    let identifier: Int
//    var body: some View {
//
//        backgroundColor
//            .cornerRadius(16)
//            .overlay(
//                VStack {
//                    HStack {
//                        TextEditor(text: $text)
//                            .foregroundColor(.white)
//                            .focused(focusField, equals: identifier)
//                            .overlay {
//                                if text.isEmpty && focusField.wrappedValue != identifier {
//                                    HStack {
//                                        VStack {
//                                            Text("세부목표")
//                                                .foregroundColor(.gray)
//                                                .allowsHitTesting(false)
//
//                                            Spacer()
//                                        }
//                                        Spacer()
//                                    }
//                                }   else {
//                                    EmptyView()
//                                }
//                            }
//                        Spacer()
//                    }
//                    Spacer()
//                    HStack {
//                        Text("\(text.count)/12")
//                            .font(.system(size: 12))
//                        Spacer()
//                    }
//                }
//                    .padding(EdgeInsets(top: 16, leading: 20, bottom: 20, trailing: 20))
//            )
//            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
//            .cornerRadius(16)
//    }
//}
//
//struct FirstCardContainerView: View {
//    private let spacing: CGFloat = 40
//    private let cardHeight: CGFloat = 140
//    @FocusState private var focusField: Int?
//    var body: some View {
//        ZStack {
//            Color(UIColor(hexString: "#202532") ?? .darkGray)
//
//            CardView(backgroundColor: .init(UIColor(hexString: "#5533c0") ?? .darkGray), focusField: $focusField, identifier: 0)
//                .offset(x: 0, y:  0 * spacing)
//                .frame(height: cardHeight, alignment: .center)
//            CardView(backgroundColor: .init(UIColor(hexString: "#35ace4") ?? .darkGray), focusField: $focusField, identifier: 1)
//                .offset(x: 0, y:  1 * spacing + (focusField == 0 ? cardHeight : 0))
//                .frame(height: cardHeight, alignment: .center)
//            CardView(backgroundColor: .init(UIColor(hexString: "#09c6a6") ?? .darkGray), focusField: $focusField, identifier: 2)
//                .offset(x: 0, y: 2 * spacing + ((focusField ?? 99 < 2) ? cardHeight : 0))
//                .frame(height: cardHeight, alignment: .center)
//            CardView(backgroundColor: .init(UIColor(hexString: "#f3c403") ?? .darkGray), focusField: $focusField, identifier: 3)
//                .offset(x: 0, y: 3 * spacing + ((focusField ?? 99 < 3) ? cardHeight : 0))
//                .frame(height: cardHeight, alignment: .center)
//        }
//        .animation(.easeInOut(duration: 0.3))
//    }
//    init() {
//        UITextView.appearance().backgroundColor = .clear
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstCardContainerView()
//    }
//}
