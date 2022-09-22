//
//  ShowDataModel.swift
//  SimplifyWorkforceDemo
//
//  Created by Abhay Pratap Singh on 22/09/22.
//

import Foundation


// MARK: - ShowDataModel
struct ShowDataModel: Codable {
    var items: [Item]?
    var hasMore: Bool?
    var quotaMax, quotaRemaining: Int?

    enum CodingKeys: String, CodingKey {
        case items
        case hasMore = "has_more"
        case quotaMax = "quota_max"
        case quotaRemaining = "quota_remaining"
    }
}

// MARK: - Item
struct Item: Codable {
    var tags: [String]?
    var owner: Owner?
    var isAnswered: Bool?
    var viewCount, answerCount, score, lastActivityDate: Int?
    var creationDate, questionID: Int?
    var link: String?
    var title: String?
    var lastEditDate, acceptedAnswerID, closedDate: Int?
    var closedReason: String?
    var protectedDate: Int?

    enum CodingKeys: String, CodingKey {
        case tags, owner
        case isAnswered = "is_answered"
        case viewCount = "view_count"
        case answerCount = "answer_count"
        case score
        case lastActivityDate = "last_activity_date"
        case creationDate = "creation_date"
        case questionID = "question_id"
        case link, title
        case lastEditDate = "last_edit_date"
        case acceptedAnswerID = "accepted_answer_id"
        case closedDate = "closed_date"
        case closedReason = "closed_reason"
        case protectedDate = "protected_date"
    }
}


// MARK: - Owner
struct Owner: Codable {
    var accountID, reputation, userID: Int?
    var userType: String?
    var acceptRate: Int?
    var profileImage: String?
    var displayName: String?
    var link: String?

    enum CodingKeys: String, CodingKey {
        case accountID = "account_id"
        case reputation
        case userID = "user_id"
        case userType = "user_type"
        case acceptRate = "accept_rate"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
    }
}
