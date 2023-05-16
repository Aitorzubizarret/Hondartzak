//
//  MainView.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta on 2023-05-16.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            Text("Hello")
                .navigationTitle("Hondartzak")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
