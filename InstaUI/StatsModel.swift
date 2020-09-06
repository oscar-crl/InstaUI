//
//  StatsModel.swift
//  InstaUI
//
//  Created by Oscar Corral on 06/09/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import Foundation

struct StatsModel: Decodable {
    var views: TotalModel
    var downloads: TotalModel
}

struct TotalModel: Decodable {
    var total: Int
}
