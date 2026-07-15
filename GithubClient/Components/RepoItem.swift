//
//  RepoItem.swift
//  GithubClient
//
//  Created by David Salomon on 9/7/26.
//

import SwiftUI

struct RepoItem: View {

    let repository: Repository

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: repository.owner.avatarUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Image(uiImage: .githubLogo)
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 8) {
                Text(repository.name)
                    .font(.title2)
                    .foregroundStyle(.accent)

                if let description = repository.description {
                    Text(description)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }

                if let language = repository.language {
                    HStack {
                        Text("Lenguaje:")
                            .fontWeight(.semibold)

                        Text(language)
                            .foregroundStyle(.blue)
                    }
                    .font(.caption)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.08), radius: 5, y: 2)
        .padding(.horizontal)
    }
}

#Preview {
    RepoItem(repository: Repository.sampleData[0])
        .padding()
}
