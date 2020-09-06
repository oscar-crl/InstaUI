//
//  AccountBar.swift
//  InstaUI
//
//  Created by Oscar Corral on 29/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import SwiftUI

struct AccountBar: View {
    
    @ObservedObject var imgCardController: ImageCardController
    
    var photoItem: PhotoModel
    
    init(item: PhotoModel) {
        imgCardController = ImageCardController(url: item.user.profile_image.large!)
        self.photoItem = item
    }
    
    var body: some View {
        HStack(spacing: 10) {
            if (imgCardController.imageCard != nil) {
                Image(uiImage: imgCardController.imageCard!).resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .cornerRadius(40)
            } else {
                Rectangle().fill(Color.gray)
                .frame(width: 40, height: 40).opacity(0.2)
                .cornerRadius(40)
            }
            VStack(alignment: .leading) {
                Text(photoItem.user.name).font(.subheadline)
                Text("@\(photoItem.user.username)").font(.caption).foregroundColor(.gray)
            }
            Spacer()
        }.padding(.leading, 10)
    }
}
