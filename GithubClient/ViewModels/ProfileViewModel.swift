//
//  ProfileViewModel.swift
//  GithubClient
//
//  Created by Luis David Salomon Plazarte on 29/7/26.
//

import Foundation
import Combine

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var user: GithubUser?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func fetchProfile() {
        // Evitar llamadas múltiples si ya está cargando
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                // Llamamos a tu servicio singleton
                self.user = try await GithubService.shared.getUserProfile()
                self.isLoading = false
            } catch {
                self.errorMessage = "Hubo un error al cargar el perfil: \(error.localizedDescription)"
                self.isLoading = false
            }
        }
    }
}
