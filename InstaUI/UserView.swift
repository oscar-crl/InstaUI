//
//  UserView.swift
//  InstaUI
//
//  Created by Oscar Corral on 29/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import SwiftUI

struct UserView: View {
    
     @ObservedObject var accountDetail: AccountDetailsController
    
    init() {
        accountDetail = AccountDetailsController(accountUrl: appConfig.username)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if (accountDetail.accountDetail.avatar != nil) {
                    UserAvatar(accountDetail: accountDetail.accountDetail)
                }
            }
            .navigationBarTitle("user", displayMode: .inline)
            .navigationBarItems(trailing:
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gear")
                }
            ).font(.system(size: 20))
        }
    }
}

struct UserAvatar: View {
    
    @ObservedObject var imgCardController: ImageCardController
    
    init(accountDetail: AccountData) {
        imgCardController = ImageCardController(url: accountDetail.avatar!)
    }
    
    var body: some View {
        HStack {
            if (imgCardController.imageCard != nil) {
                Image(uiImage: imgCardController.imageCard!).resizable().aspectRatio(contentMode: .fit)
            } else {
                Rectangle().fill(Color.gray).opacity(0.2)
            }
        }.frame(width: 80, height: 80)
        .cornerRadius(80).padding(.leading, 10)
    }
}
