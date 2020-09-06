//
//  Config.swift
//  InstaUI
//
//  Created by Oscar Corral on 29/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import Foundation

class AppConfig: ObservableObject {
    //MARK:- Static app info
    let username = "me"
    let apiEndpoint = "https://api.unsplash.com/"
    let accessToken = "{{unsplash_access_token}}"
    
    //MARK:- Global state app config
    @Published var uiImproved: Bool
    @Published var tags: [String]
    @Published var tagsIndex: Int
    
    init() {
        uiImproved = true
        tags = ["abstract", "wallpaper", "macro"]
        tagsIndex = 0
    }
}
