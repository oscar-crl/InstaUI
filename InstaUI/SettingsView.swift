//
//  SettingsView.swift
//  InstaUI
//
//  Created by Oscar Corral on 29/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var stateAppConfig = appConfig
    
    var body: some View {
        Form {
            Section(header: Text("Visual Effects")) {
                Toggle(isOn: self.$stateAppConfig.uiImproved) {
                    Text("Improve UI")
                }
            }
        }.navigationBarTitle("Settings", displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}