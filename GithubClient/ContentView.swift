//
//  ContentView.swift
//  GithubClient
//
//  Created by David Salomon on 13/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView (selection: $selectedTab) {
            RepoList()
                .tabItem {
                    Label("Repositorios",
                    systemImage:
                    "rectangle.stack")
                }
                .tag(0)
            RepoForm(selectedTab: $selectedTab)
                .tabItem {
                    Label("Nuevo Repositorio",
                          systemImage: "plus")
                }
                .tag(1)
            Profile()
                .tabItem {
                    Label("Perfil",
                    systemImage: "person.crop.circle")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
