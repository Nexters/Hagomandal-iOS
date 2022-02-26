//
//  ContentView.swift
//  Hagomandal
//
//  Created by 최동규 on 2022/02/19.
//  Copyright © 2022 NxMachineCorps. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var shouldShowOnboarding: Bool = true
    
    var body: some View {
        OnboardingView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView()
            GuideView()
        }
    }
}
