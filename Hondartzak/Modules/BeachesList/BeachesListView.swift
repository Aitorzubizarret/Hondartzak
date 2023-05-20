//
//  BeachesListView.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta on 2023-05-18.
//

import SwiftUI

struct BeachesListView: View {
    
    @StateObject private var viewModel = BeachesListViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.searchText.isEmpty {
                List {
                    ForEach(viewModel.favoriteBeaches, id: \.id) { beach in
                        BeachesListItemView(beach: beach)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear) // Hides highlight color when tappping an element.
                            .buttonStyle(PlainButtonStyle())
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Hondartzak")
            } else {
                List {
                    ForEach(viewModel.filteredBeaches, id: \.id) { filteredBeach in
                        Text(filteredBeach.name)
                    }
                }
            }
        }
        .searchable(text: $viewModel.searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Aurkitu zure hondartza")
    }
    
}

struct BeachesListView_Previews: PreviewProvider {
    static var previews: some View {
        BeachesListView()
    }
}
