//
//  StatsController.swift
//  InstaUI
//
//  Created by Oscar Corral on 06/09/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import Foundation
import Combine

class StatsController: ObservableObject {
    
    @Published var photoStats: StatsModel? = nil
    
    func getStats(url: String, method: String) {

        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = method
        
        request.setValue("Client-ID \(app.accessToken)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { (data, _, _) in
            do {
                let stats = try JSONDecoder().decode(StatsModel.self, from: data!)
                DispatchQueue.main.async {
                    self.photoStats = stats
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
