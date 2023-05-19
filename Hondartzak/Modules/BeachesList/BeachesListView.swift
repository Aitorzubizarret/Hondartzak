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
            List {
                ForEach(viewModel.filteredBeaches, id: \.self) { beach in
                    NavigationLink {
                        BeachDetailView()
                    } label: {
                        Text(beach)
                    }
                }
            }
            .navigationTitle("Hondartzak")
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
