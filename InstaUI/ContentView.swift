//
//  ContentView.swift
//  InstaUI
//
//  Created by Oscar Corral on 25/08/2020.
//  Copyright © 2020 Oscar Corral. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView().tabItem {
                selectedTab == 0 ? Image(systemName: "house.fill") : Image(systemName: "house")
            }.tag(0)
            UserView().tabItem {
                selectedTab == 1 ? Image(systemName: "person.fill") : Image(systemName: "person")
            }.tag(1)
        }
    }
}
