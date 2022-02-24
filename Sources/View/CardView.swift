//
// Created by KHU_TAEWOO on 2022/02/20.
// Copyright (c) 2022 NxMachineCorps. All rights reserved.
//

import SwiftUI

struct CardView: View {

	enum CardHeight: Int {
		case flipped = 140
		case full = 250
	}

	@State var title: String = ""

	let backgroundColor: Color
	var focusField: FocusState<Int?>.Binding
	let identifier: Int

	var body: some View {

		backgroundColor
				.cornerRadius(16)
				.overlay(
						VStack {
							HStack {
								TextEditor(text: $title)
										.foregroundColor(.white)
										.focused(focusField, equals: identifier)
										.overlay {
											if title.isEmpty && focusField.wrappedValue != identifier {
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
								Text("\(title.count)/12")
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
