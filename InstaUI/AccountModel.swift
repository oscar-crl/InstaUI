//
//  AccountDetailsModel.swift
//  InstaUI
//
//  Created by Oscar Corral on 29/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import Foundation

struct AccountDetailsModel : Decodable {
    var data: AccountData
}

struct AccountData : Decodable {
    var avatar: URL? = nil
}
