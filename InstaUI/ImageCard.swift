//
//  ImageCard.swift
//  InstaUI
//
//  Created by Oscar Corral on 27/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

struct ImageCard: View {
    
    @ObservedObject var imgCardController: ImageCardController
    
    @ObservedObject var accountDetail: AccountDetailsController
    
    @ObservedObject var stateAppConfig = appConfig
    
    var imgItem: ItemsEntry
    
    init(item: ItemsEntry) {
        imgCardController = ImageCardController(url: item.images![0].link)
        imgItem = item
        accountDetail = AccountDetailsController(accountUrl: item.account_url)
    }
    
    @State var startPoint = UnitPoint(x: 0, y: 0)
    @State var endPoint = UnitPoint(x: 0, y: 2)
    
    var body: some View {
        HStack {
            if (imgCardController.imageCard != nil) {
                ZStack {
                    NavigationLink(destination: ImageDetail(item: self.imgItem, uiImage: self.imgCardController.imageCard!, accountDetail: self.accountDetail.accountDetail)) {
                        Image(uiImage: self.imgCardController.imageCard!).resizable().aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 400, maxHeight: 400, alignment: .center).clipped()
                    }.cornerRadius(20).padding(.horizontal, 30).zIndex(1)
                    if (stateAppConfig.uiImproved) {
                        Image(uiImage: self.imgCardController.imageCard!).resizable().aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 400, maxHeight: 400, alignment: .center)
                            .clipped().cornerRadius(20).offset(y: 15).blur(radius: 20).opacity(0.8)
                            .padding(.horizontal, 40)
                    }
                }
            } else {
                RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray, Color.white]), startPoint: self.startPoint, endPoint: self.endPoint))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 400, maxHeight: 400, alignment: .center).opacity(0.2)
                    .padding(.horizontal, 30)
                    .onAppear {
                            let baseAnimation = Animation.easeInOut(duration: 2)
                            let repeated = baseAnimation.repeatForever()
                            withAnimation (repeated){
                                self.startPoint = UnitPoint(x: 1, y: -1)
                                self.endPoint = UnitPoint(x: 0, y: 1)
                        }
                    }
            }
        }
    }
}

class ImageCardController: ObservableObject {
    
    @Published var imageCard: UIImage? = nil
    
    init(url: URL) {
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                self.imageCard = UIImage(data: data!)!
            }
        })
        task.resume()
    }
}
