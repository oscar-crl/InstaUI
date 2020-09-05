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
    
    var item: ItemsEntry
    
    init(item: ItemsEntry, accountDetail: AccountData) {
        imgCardController = ImageCardController(url: accountDetail.avatar!)
        self.item = item
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
            Text(item.account_url != nil ? item.account_url! : "Nobody").font(.subheadline)
            Spacer()
        }.padding(.leading, 10)
    }
}
