//
//  ImageDetail.swift
//  InstaUI
//
//  Created by Oscar Corral on 29/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import SwiftUI

struct ImageDetail: View {
    
    var item: ItemsEntry
    
    var uiImage: UIImage
    
    var accountDetail: AccountData
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                AccountBar(item: item, accountDetail: accountDetail)
                ZStack {
                    Image(uiImage: uiImage).resizable().aspectRatio(contentMode: .fit).zIndex(1)
                    if (appConfig.uiImproved) {
                        Image(uiImage: uiImage).resizable().aspectRatio(contentMode: .fit).blur(radius: 30)
                    }
                }
                VStack {
                    HStack(spacing: 20) {
                        HStack(spacing: 5) {
                            Image(systemName: "heart")
                            Text("\(item.ups)").font(.caption)
                        }
                        HStack(spacing: 5) {
                            Image(systemName: "bubble.right")
                            Text("\(item.comment_count)").font(.caption)
                        }
                        Image(systemName: "paperplane")
                        Spacer()
                        Image(systemName: "bookmark")
                    }.padding(.bottom, 5)
                    HStack {
                        Text("\(item.points) \(item.points > 1 ? "points" : "point")").font(.caption)
                        Spacer()
                    }
                    HStack {
                        Text("\(item.views) \(item.views > 1 ? "views" : "view")").font(.caption)
                        Spacer()
                    }
                }.padding(.vertical, 20).padding(.horizontal, 30).font(.system(size: 22.0))
            }
        }.padding(.top, -50)
    }
}

//.background(Image(uiImage: uiImage).resizable().aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all).blur(radius: 30).opacity(0.5))
