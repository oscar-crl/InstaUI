//
//  PhotoController.swift
//  InstaUI
//
//  Created by Oscar Corral on 06/09/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import Foundation
import Combine

class PhotoController: ObservableObject {
    
    @Published var photoList = [PhotoModel]()
    
    func getPhotos(url: String, method: String) {

        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = method
        
        request.setValue("Client-ID \(app.accessToken)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { (data, _, _) in
            do {
                let photos = try JSONDecoder().decode(ResultModel.self, from: data!)
                DispatchQueue.main.async {
                    self.photoList = photos.results
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
