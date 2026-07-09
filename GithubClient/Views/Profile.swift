//
//  Profile.swift
//  GithubClient
//
//  Created by Usuario invitado on 8/7/26.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("David Salomon")
                    .font(.title)
                Image (uiImage: .githubLogo)
                    .resizable()
                    .scaledToFit()
                Text("david_salomon07")
                    .font(.headline)
                    .padding(.vertical)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                    .font(.caption)
            }
            .padding()
            .navigationTitle("Perfil")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Profile()
}
