//
//  UserInfoTarget.swift
//  Hagomandal
//
//  Created by 최동규 on 2022/02/19.
//  Copyright © 2022 NxMachineCorps. All rights reserved.
//

import Moya
import SwiftUI

extension Encodable {
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self))) as? [String: Any] ?? [:]
    }
}

enum UserInfoTarget {
    case registerUserInfo(categoryCode: UserCategoryCode, value: UserInfoValue)
    case hints(code: [UserInfoValue], hintsFor: String)
}

extension UserInfoTarget: TargetType {
    var baseURL: URL {
        return URL(string: .baseURLString)!
    }

    var path: String {
        switch self {
        case .registerUserInfo: return "/v0/users"
        case .hints: return "/v0/user_info/hints"
        }
    }

    var method: Moya.Method {
        switch self {
        case .registerUserInfo:
            return .post
        case .hints:
            return .get
        }
    }

    var task: Task {
        var urlParameters = ["tracking_id": UserInfoManager.shared.trackingID]
        switch self {
        case .registerUserInfo(let code, let value):
            return .requestCompositeParameters(bodyParameters: ["category_code": code.rawValue, "value": ["code": value.code, "display": value.display]], bodyEncoding: URLEncoding.default, urlParameters: urlParameters)
        case .hints(let determined, let position):
            urlParameters["hints_for"] = position
            return .requestCompositeParameters(bodyParameters: determined.dictionary, bodyEncoding: URLEncoding.default, urlParameters: urlParameters)
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

enum UserCategoryCode: String, Codable {
    case big = "JOB_TYPE_LV_0"
    case medium = "JOB_TYPE_LV_1"
    case small = "JOB_TYPE_LV_2"
    case interest = "INTEREST"
}

struct UserInfoValue: Codable {
    let code: UserCategoryCode
    let display: String
}

enum User {
    case designer
    case developer
    case notAssigned

    var code: String {
        switch self {
        case .designer:
            return "DESIGNER"
        case .developer:
            return "DEVELOPER"
        case .notAssigned:
            return "NOT_ASSIGNED"
        }
    }

    var display: String {
        switch self {
        case .designer:
            return "디자이너"
        case .developer:
            return "개발자"
        case .notAssigned:
            return "미정"
        }
    }
}
