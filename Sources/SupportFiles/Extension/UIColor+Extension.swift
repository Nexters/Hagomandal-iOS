//
// Created by KHU_TAEWOO on 2022/02/20.
// Copyright (c) 2022 NxMachineCorps. All rights reserved.
//

import UIKit

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