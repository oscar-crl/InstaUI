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
            Section(header: Text("Display")) {
                Picker(selection: self.$stateAppConfig.tagsIndex, label: Text("Select tag")) {
                    ForEach(0 ..< self.stateAppConfig.tags.count) {
                        Text(self.stateAppConfig.tags[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
        }.navigationBarTitle("Settings", displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
