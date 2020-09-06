//
//  UserView.swift
//  InstaUI
//
//  Created by Oscar Corral on 29/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import SwiftUI

struct UserView: View {
    
    init() {
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("User")
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
