//
//  UserTarget.swift
//  Hagomandal
//
//  Created by 최동규 on 2022/02/19.
//  Copyright © 2022 NxMachineCorps. All rights reserved.
//

import Moya

extension String {
    static let baseURLString = ""
}

enum UserTarget {
    case registerUser(user: String)
}

extension UserTarget: TargetType {
    var baseURL: URL {
        return URL(string: .baseURLString)!
    }

    var path: String {
        switch self {
        case .registerUser: return "/v0/users"
        }
    }

    var method: Moya.Method {
        switch self {
        case .registerUser:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .registerUser:
            return .requestParameters(parameters: ["tracking_id": UserInfoManager.shared.trackingID ], encoding: URLEncoding.default)
        }
    }

    var headers: [String: String]? {
        switch self {
        default: return ["API-KEY": UserInfoManager.shared.apiKey, "Content-Type": "application/json"]
        }
    }

    var validationType: ValidationType {
      return .successCodes
    }
}
