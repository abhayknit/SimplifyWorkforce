//
//  AConstants.swift
//  SimplifyWorkforceDemo
//
//  Created by Abhay Pratap Singh on 22/09/22.
//

import Foundation
struct API {
    static var baseURL: String = "https://api.stackexchange.com"
    static var path: String = API.baseURL
}

struct GAPIConstant {
    static func getDataApiUrl(_ pageNumber:Int) -> String {
        return API.path + "/questions?site=stackoverflow&page=\(pageNumber)"
    }
}


struct Constant {
    static let error = "Error"
    static let noData = "Data not found."
    static let serverError = "unexpected status code/Server not found"
    static let somethingWrong = "Some thing went wrong"
    static let ok = "OK"
    
    static let cellIdentifier = "ShowDataCell"
}
