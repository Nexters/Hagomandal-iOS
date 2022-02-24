////
////  ContentView.swift
////  SU_Animation
////
////  Created by KHU_TAEWOO on 2022/01/27.
////
//
//import SwiftUI
//
//struct CardListContainer: View {
//
//    let colors: [Color] = [.red, .blue, .green, .gray]
//
//    @State private var padding: CGFloat = 0.0
//    @State private var height: CGFloat = 192
//
//    @State private var orders = [0,1,2,3]
//    @State private var isEntered = false
//
//    var body: some View {
//
//        ScrollViewReader { proxy in
//            Button("Transition") {
//                isEntered.toggle()
//                withAnimation(.easeOut(duration: 0.3)) {
//                    self.orders.reverse()
//                    padding = 24
//                    proxy.scrollTo(1, anchor: .center)
//                }
//            }
//            ScrollView {
//                ForEach(orders, id: \.self) { i in
//                    CellView(color: colors[i])
//                        .id(i)
//                        .frame(width: 300, height: isEntered ? 250 : 192, alignment: .center)
//                        .padding(.bottom, padding)
//                }
//            }
//
//
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
