//
//  AccountDetailsController.swift
//  InstaUI
//
//  Created by Oscar Corral on 29/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class AccountDetailsController: ObservableObject {

    @Published var accountDetail = AccountData()
    
    init(accountUrl: String) {
        getAccountDetails(url: "\(appConfig.apiEndpoint)account/\(accountUrl)/avatar", method: "GET")
    }
    
    func getAccountDetails(url: String, method: String) {

        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = method
        
        request.setValue("Bearer \(appConfig.accessToken)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
            do {
                let account = try JSONDecoder().decode(AccountDetailsModel.self, from: data!)
                DispatchQueue.main.async {
                    self.accountDetail = account.data
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
