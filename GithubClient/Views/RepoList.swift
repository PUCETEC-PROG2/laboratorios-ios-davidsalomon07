//
//  GithubClient
//
//  Created by David Salomon on 8/7/26.
//

import SwiftUI

struct RepoList: View {
    @StateObject var viewController = RepoListViewController()

    var body: some View {
        NavigationStack {
            Group {
                if viewController.isLoading {
                    ProgressView("Cargando repositorios...")
                } else if let errorMsg = viewController.errorMsg {
                    Text(errorMsg)
                        .foregroundStyle(.red)
                        .padding()
                } else {
                    List(viewController.repos) { repo in
                        RepoItem(repository: repo)
                    }
                }
            }
            .navigationTitle("Repositorios")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            Task {
                await viewController.loadRepos()
            }
        }
    }
}

#Preview {
    RepoList()
}
