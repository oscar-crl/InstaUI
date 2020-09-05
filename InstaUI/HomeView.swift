//
//  Timeline.swift
//  InstaUI
//
//  Created by Oscar Corral on 25/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

var appConfig = AppConfig()

struct HomeView: View {
    
    @ObservedObject var galleryController = GalleryController()
    
    @State var isSelected = false
    @State var page = 0
    
    init() {
        galleryController.getGallery(url: "\(appConfig.apiEndpoint)gallery/t/\(appConfig.tags[appConfig.tagsIndex])/top/all/1", method: "GET")
    }

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                if (!galleryController.galleryList.isEmpty) {
                    ForEach(galleryController.galleryList[page]) { imgItem in
                        if ((imgItem.link != nil && (imgItem.type == Type.JPEG || imgItem.type == Type.PNG)) ||
                            (imgItem.images != nil && (imgItem.images![0].type == Type.JPEG || imgItem.images![0].type == Type.PNG))) {
                            VStack {
                                ImageCard(item: imgItem)
                                VStack {
                                    HStack(spacing: 20) {
                                        Image(systemName: "heart")
                                        Image(systemName: "bubble.right")
                                        Image(systemName: "paperplane")
                                        Spacer()
                                        Image(systemName: "bookmark")
                                    }.padding(.bottom, 5)
                                    HStack {
                                        Text("\(imgItem.points) \(imgItem.points > 1 ? "points" : "point")").font(.caption)
                                        Spacer()
                                    }
                                }.padding(.vertical, 20).padding(.horizontal, 30).font(.system(size: 22.0))
                            }
                        }
                    }.id(UUID())
                } else {
                    VStack(alignment: .center) {
                        ActivityIndicator()
                    }.frame(maxWidth: .infinity)
                }
            }.buttonStyle(PlainButtonStyle()).navigationBarTitle("Home")
        }
    }
}

//completionHeader: @escaping ([DataEntry]?) -> Void / completionHeader(img.data)

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .medium)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}
