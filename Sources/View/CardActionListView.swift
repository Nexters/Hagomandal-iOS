//
// Created by KHU_TAEWOO on 2022/02/20.
// Copyright (c) 2022 NxMachineCorps. All rights reserved.
//

import SwiftUI

struct CardActionListView: View {

	static let actionSize = 4

	@State private var actions: [String] = Array(repeating: "aaaaa", count: actionSize)
	@FocusState private var focusId: Int?
	var body: some View {
		VStack {
			ForEach(0..<4) { idx in
                HStack(alignment: .center) {
                    Text("\u{2022}")
                            .padding(.leading, 20)
                    TextEditor(text: $actions[idx])
							.focused($focusId, equals: idx)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
							.submitLabel(.next)
							.onSubmit {
								guard let focusId = focusId else { return }
								switch focusId {
									case 0...2:
										self.focusId = focusId + 1
									case CardActionListView.actionSize - 1:
										self.focusId = nil
									default:
										self.focusId = nil
								}
							}
                }
			}
		}
	}
}


struct Previews_CardActionListView_Previews: PreviewProvider {
    static var previews: some View {
        CardActionListView()
    }
}
