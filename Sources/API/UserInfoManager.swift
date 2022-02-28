//
//  UserInfoManager.swift
//  Hagomandal
//
//  Created by 최동규 on 2022/02/19.
//  Copyright © 2022 NxMachineCorps. All rights reserved.
//

import Foundation

final class UserInfoManager {

    static let shared = UserInfoManager()
    var trackingID: String {
        guard let trackingID = UserDefaults.standard.string(forKey: "tracking_id") else {
            let trackingUUID = UUID()
            UserDefaults.standard.set(trackingUUID.uuidString, forKey: "tracking_id")
            return trackingUUID.uuidString
        }
        return trackingID
    }
    let apiKey: String = "notImplemented"

    private init() {
        let trackingUUID = UUID()
        UserDefaults.standard.set(trackingUUID.uuidString, forKey: "tracking_id")
    }
}
