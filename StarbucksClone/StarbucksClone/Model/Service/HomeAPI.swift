//
//  HomeAPI.swift
//  StarbucksClone
//
//  Created by 김한솔 on 2022/05/17.
//

import Foundation

enum HomeAPI {
    case fetchHomeComponents
    case fetchBeverageImages(_ imageCD: String)
    case fetchBeverageInfo(_ infoCD: String)

    var baseURL: String {
        switch self {
        case .fetchHomeComponents:
            return "https://api.codesquad.kr"
        case .fetchBeverageImages(_), .fetchBeverageInfo(_):
            return "https://www.starbucks.co.kr/menu"
        }
    }

    var path: String {
        switch self {
        case .fetchHomeComponents:
            return "/starbuckst"
        case .fetchBeverageImages(_):
            return "/productFileAjax.do"
        case .fetchBeverageInfo(_):
            return "/productViewAjax.do"
        }
    }

    var method: String {
        switch self {
        case .fetchHomeComponents:
            return "GET"
        case .fetchBeverageImages(_), .fetchBeverageInfo(_):
            return "POST"
        }
    }

    var headerContentType: String? {
        switch self {
        case .fetchHomeComponents:
            return nil
        case .fetchBeverageImages(_), .fetchBeverageInfo(_):
            return "application/x-www-form-urlencoded; charset=utf-8"
        }
    }

    var parameter: [String: Any]? {
        switch self {
        case .fetchHomeComponents:
            return nil
        case .fetchBeverageImages(let cd):
            return ["PRODUCT_CD": cd]
        case .fetchBeverageInfo(let cd):
            return ["product_cd": cd]
        }
    }
}
