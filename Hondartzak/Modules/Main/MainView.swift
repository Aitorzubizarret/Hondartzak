//
//  MainView.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta on 2023-05-16.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.beaches, id: \.self) { beach in
                    Text(beach)
                }
            }
            .navigationTitle("Hondartzak")
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
