//
//  ImageDetail.swift
//  InstaUI
//
//  Created by Oscar Corral on 29/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import SwiftUI

struct ImageDetail: View {
    
    @ObservedObject var statsController = StatsController()
    
    var item: PhotoModel
    
    var image: UIImage
    
    init(item: PhotoModel, image: UIImage) {
        self.item = item
        self.image = image
        statsController.getStats(url: "\(app.apiEndpoint)photos/\(item.id)/statistics", method: "GET")
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                AccountBar(item: item)
                ZStack {
                    Image(uiImage: image).resizable().aspectRatio(contentMode: .fit).zIndex(1)
                    if (app.uiImproved) {
                        Image(uiImage: image).resizable().aspectRatio(contentMode: .fit).blur(radius: 30)
                    }
                }
                VStack {
                    HStack(spacing: 20) {
                        HStack(spacing: 5) {
                            Image(systemName: "heart")
                            Text("\(item.likes)").font(.caption)
                        }
                        HStack(spacing: 5) {
                            Image(systemName: "bubble.right")
                            Text("\(20)").font(.caption)
                        }
                        Image(systemName: "paperplane")
                        Spacer()
                        Image(systemName: "bookmark")
                    }.padding(.bottom, 5)
                    HStack {
                        (statsController.photoStats != nil) ? Text("\(statsController.photoStats!.views.total) views").font(.caption) : nil
                        Spacer()
                    }
                    HStack {
                        (statsController.photoStats != nil) ? Text("\(statsController.photoStats!.downloads.total) downloads").font(.caption) : nil
                        Spacer()
                    }
                }.padding(.vertical, 20).padding(.horizontal, 30).font(.system(size: 22.0))
            }
        }.padding(.top, -50)
    }
}

//.background(Image(uiImage: uiImage).resizable().aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all).blur(radius: 30).opacity(0.5))
