//
//  SettingsView.swift
//  InstaUI
//
//  Created by Oscar Corral on 29/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var appState = app
    
    var body: some View {
        Form {
            Section(header: Text("Visual Effects")) {
                Toggle(isOn: self.$appState.uiImproved) {
                    Text("Improve UI")
                }
            }
            Section(header: Text("Display")) {
                Picker(selection: self.$appState.tagsIndex, label: Text("Select tag")) {
                    ForEach(0 ..< self.appState.tags.count) {
                        Text(self.appState.tags[$0])
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
