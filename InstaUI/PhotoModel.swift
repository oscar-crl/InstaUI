//
//  PhotoModel.swift
//  InstaUI
//
//  Created by Oscar Corral on 05/09/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import Foundation

struct ResultModel: Decodable {
    var results: [PhotoModel]
}

struct PhotoModel: Decodable, Identifiable {
    var id: String
    var likes: Int
    var urls: UrlsEntry
    var user: UserEntry
}

struct UserEntry: Decodable, Identifiable {
    var id: String
    var username: String
    var name: String
    var profile_image: UrlsEntry
}

struct UrlsEntry: Decodable {
    var full: URL? = nil
    var large: URL? = nil
    var small: URL
}
