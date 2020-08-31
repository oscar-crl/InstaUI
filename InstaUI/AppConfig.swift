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
    let apiEndpoint = "https://api.imgur.com/3/"
    let accessToken = "{{accesToken}}"
    let clientID = "{{clientID}}"
    
    //MARK:- Global state app config
    @Published var uiImproved: Bool
    
    init() {
        uiImproved = true
    }
}
