//
//  ContentView.swift
//  SwiftUIMatchedGeometry
//
//  Created by toby.with on 2022/01/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HeroAnimationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                HeroAnimationView()
            }
            .previewDisplayName("Hero Animation")
        }
    }
}

struct HeroAnimationView: View {
    @State private var showDetail = false
    @Namespace private var articleTransition
    
    var body: some View {
        if !showDetail {
            FirstAnimationView(showDetail: $showDetail, articleTransition: articleTransition)
        } else {
            SecondAnimationView(showDetail: $showDetail, articleTransition: articleTransition)
        }
    }
}

struct FirstAnimationView: View {
    @Binding var showDetail: Bool
    var articleTransition: Namespace.ID
    
    @State var goals: [Goal] = testGoals
    
    var body: some View {
        Color("BackgroundColor")
            .ignoresSafeArea()
        
        ScrollView(.vertical) {
            FirstGoalView(goal: goals[0])
                .matchedGeometryEffect(id: "goal1", in: articleTransition)
            FirstGoalView(goal: goals[1])
                .matchedGeometryEffect(id: "goal2", in: articleTransition)
            FirstGoalView(goal: goals[2])
                .matchedGeometryEffect(id: "goal3", in: articleTransition)
            FirstGoalView(goal: goals[3])
                .matchedGeometryEffect(id: "goal4", in: articleTransition)
        }
        .padding([.leading, .trailing], 20)
        .animation(.easeOut)
        .onTapGesture {
            showDetail.toggle()
        }
    }
}

struct SecondAnimationView: View {
    @Binding var showDetail: Bool
    var articleTransition: Namespace.ID
    
    @State var goals: [Goal] = testGoals
    
    var body: some View {
        Color("BackgroundColor")
            .ignoresSafeArea()
        
        HStack {
            VStack {
                SecondGoalView(goal: goals[0])
                    .matchedGeometryEffect(id: "goal1", in: articleTransition)
                SecondGoalView(goal: goals[3])
                    .matchedGeometryEffect(id: "goal4", in: articleTransition)
            }
            
            VStack {
                SecondGoalView(goal: goals[1])
                    .matchedGeometryEffect(id: "goal2", in: articleTransition)
                SecondGoalView(goal: goals[2])
                    .matchedGeometryEffect(id: "goal3", in: articleTransition)
            }
        }
        .animation(.easeOut)
        .onTapGesture {
            showDetail.toggle()
        }
    }
}
