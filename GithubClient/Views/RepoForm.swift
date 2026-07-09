//
//  RepoForm.swift
//  GithubClient
//
//  Created by Usuario invitado on 8/7/26.
//

import SwiftUI

struct RepoForm: View {
    @State private var repoName: String = ""
    @State private var repoDescription: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                TextField("Formulario de repositorio", text: $repoName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                
                TextField("Descripcion del repositorio", text: $repoDescription)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(4...10)
                    .padding(.vertical)
                Spacer()
                Button(action: {
                    print ("Boton aplastado")
                }){
                    Label("Guardar Repo", systemImage: "square.and.arrow.down")
                        .padding(.all, 8)
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Formulario")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RepoForm()
}
