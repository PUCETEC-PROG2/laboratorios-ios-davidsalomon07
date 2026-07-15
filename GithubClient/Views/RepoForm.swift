//
//  GithubClient
//
//  Created by David Salomon on 8/7/26.
//

import SwiftUI

struct RepoForm: View {
    @State private var repoName: String = ""
    @State private var repoDescription: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                TextField(
                    "", text: $repoName,
                    prompt: Text("Nombre del repositorio")
                        .foregroundStyle(.accent.opacity(0.6))
                )
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                
                TextField("", text: $repoDescription,
                prompt: Text("Descripción del repositorio")
                    .foregroundStyle(.accent.opacity(0.6))
                )
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(4...10)
                    .padding(.vertical)
                Spacer()
                Button(action: {
                    print("Botón Aplastado")
                }){
                    
                    Label("Guardar repo", systemImage: "square.and.arrow.down")
                        .padding(.all, 8)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Formulario de repositorio")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RepoForm()
}
