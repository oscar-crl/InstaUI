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

var app = AppConfig()

struct HomeView: View {
    
    @ObservedObject var photoController = PhotoController()
    
    @State var page = 1
    
    init() {
        photoController.getPhotos(url: "\(app.apiEndpoint)search/photos?page=\(page)&query=\(app.tags[app.tagsIndex])", method: "GET")
    }

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                if (!photoController.photoList.isEmpty) {
                    ForEach(photoController.photoList) { photoItem in
                        VStack {
                            ImageCard(item: photoItem)
                            VStack {
                                HStack(spacing: 20) {
                                    HStack(spacing: 5) {
                                        Image(systemName: "heart")
                                        Text("\(photoItem.likes)").font(.caption)
                                    }
                                    Image(systemName: "bubble.right")
                                    Image(systemName: "paperplane")
                                    Spacer()
                                    Image(systemName: "bookmark")
                                }.padding(.bottom, 5)
                            }.padding(.vertical, 20).padding(.horizontal, 30).font(.system(size: 22.0))
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
