//
//  Profile.swift
//  GithubClient
//
//  Created by Usuario invitado on 8/7/26.
//

import SwiftUI

struct Profile: View {
    @StateObject private var viewModel = ProfileViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Cargando perfil...")
                        .padding()
                } else if let user = viewModel.user {
                    Text(user.name ?? "Sin nombre")
                        .font(.title)
                                    
                    AsyncImage(url: URL(string: user.avatarUrl)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                        case .failure:
                            Image(uiImage: .githubLogo)
                                .resizable()
                                .scaledToFit()
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(maxHeight: 200)
                                    
                    Text("@\(user.login)")
                        .font(.headline)
                        .padding(.vertical)
                                    
                    if let bio = user.bio {
                        Text(bio)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                                    
                    Button("Reintentar") {
                        viewModel.fetchProfile()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top)
                }
            }
            .padding()
            .navigationTitle("Perfil")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {      //Sin esto no carga la imagen, se quedaria cargando
                viewModel.fetchProfile()
            }
        }
    }
}

#Preview {
    Profile()
}
