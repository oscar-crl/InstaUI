//
//  GalleryController.swift
//  InstaUI
//
//  Created by Oscar Corral on 27/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import Foundation
import Combine

class GalleryController: ObservableObject {
    
    @Published var galleryList = [[ItemsEntry]]()
    
    func getGallery(url: String, method: String) {

        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = method
        
        request.setValue("Client-ID \(appConfig.clientID)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
            do {
                let img = try JSONDecoder().decode(GalleryModel.self, from: data!)
                DispatchQueue.main.async {
                    self.galleryList = img.data.items.chunked(into: 50)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
