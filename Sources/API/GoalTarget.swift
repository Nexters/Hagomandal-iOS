//
//  GoalInfoTarget.swift
//  Hagomandal
//
//  Created by 최동규 on 2022/02/19.
//  Copyright © 2022 NxMachineCorps. All rights reserved.
//

import Moya
import SwiftUI

enum GoalInfoTarget {
    case registerPurpose(mandalrtID: String)
    case registerNode(purposeID: String, node: Node)
}

extension GoalInfoTarget: TargetType {
    var baseURL: URL {
        return URL(string: .baseURLString)!
    }

    var path: String {
        switch self {
        case .registerPurpose: return "/v0/purpose"
        case .registerNode(let purposeID, _): return "/v0/purpose/\(purposeID)/"
        }
    }

    var method: Moya.Method {
        switch self {
        case .registerPurpose:
            return .post
        case .registerNode:
            return .post
        }
    }

    var task: Task {
        let urlParameters = ["tracking_id": UserInfoManager.shared.trackingID]
        switch self {
        case .registerPurpose(let mandalrtID):
            return .requestCompositeParameters(bodyParameters: ["mandalart_id": mandalrtID], bodyEncoding: URLEncoding.default, urlParameters: urlParameters)
        case .registerNode(_, let node):
            return .requestCompositeParameters(bodyParameters: node.dictionary, bodyEncoding: URLEncoding.default, urlParameters: urlParameters)
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

struct Node: Codable {
    let level: Int
    let postion: Int
    let title: String
    let content: String?
}
