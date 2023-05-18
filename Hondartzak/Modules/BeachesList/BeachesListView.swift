//
//  BeachesListView.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta on 2023-05-18.
//

import SwiftUI

struct BeachesListView: View {
    
    @StateObject private var viewModel = BeachesListViewModel()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.beaches, id: \.self) { beach in
                    NavigationLink {
                        BeachDetailView()
                    } label: {
                        Text(beach)
                    }
                }
            }
            .navigationTitle("Hondartzak")
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
    
}

struct BeachesListView_Previews: PreviewProvider {
    static var previews: some View {
        BeachesListView()
    }
}
