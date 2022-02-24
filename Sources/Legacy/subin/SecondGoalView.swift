//
//  SecondGoalView.swift
//  CardAnimation
//
//  Created by toby.with on 2022/01/29.
//

import SwiftUI

struct SecondGoalView: View {
    var goal: Goal
    @State var content: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(goal.content ?? "default value")
                .bold()
                .font(.title)
            TextField("Type something...", text: $content)
            TextField("Type something...", text: $content)
            TextField("Type something...", text: $content)
            TextField("Type something...", text: $content)
        }
        .padding(15)
        .foregroundColor(.white)
        .background(goal.color)
        .border(Color.white, width: 1)
        .cornerRadius(18)
    }
}

struct SecondGoalView_Previews: PreviewProvider {
    static var previews: some View {
        SecondGoalView(goal: testGoals[0])
            .previewLayout(.sizeThatFits)
    }
}
