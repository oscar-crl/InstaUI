//
//  GalleryModel.swift
//  InstaUI
//
//  Created by Oscar Corral on 25/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import Foundation

enum Type: String, Decodable {
    case PNG = "image/png"
    case JPEG = "image/jpeg"
    case MP4 = "video/mp4"
    case GIF = "image/gif"
}

struct GalleryModel : Decodable {
    var data: DataEntry
}

struct DataEntry: Decodable {
    var items: [ItemsEntry]
}

struct ItemsEntry: Decodable, Identifiable {
    var id: String
    var title: String
    var account_url: String? = nil
    var points: Int
    var views: Int
    var ups: Int
    var comment_count: Int
    var type: Type? = nil
    var link: URL? = nil
    var images: [ImagesEntry]? = nil
}

struct ImagesEntry: Decodable, Identifiable {
    var id: String
    var type: Type
    var link: URL
}

struct ImageInfo {
    var title: String
    var points: Int
}
