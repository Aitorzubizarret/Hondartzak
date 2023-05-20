//
//  BeachesListItemView.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta on 2023-05-19.
//

import SwiftUI

struct BeachesListItemView: View {
    
    var beachName: String
    
    var body: some View {
        NavigationLink(destination: BeachDetailView()) {
            HStack(spacing: 0) {
                VStack(alignment: .leading) {
                    Text(beachName)
                        .font(Font.system(size: 18, weight: Font.Weight.bold, design: Font.Design.default))
                        .foregroundColor(Color.black)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                    Text("Donostia")
                        .font(Font.system(size: 12, weight: Font.Weight.bold, design: Font.Design.default))
                        .foregroundColor(Color.black)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                }
                Spacer()
                VStack(alignment: .center) {
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25, alignment: .center)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .foregroundStyle(.yellow)
                    Text("19º")
                        .font(Font.system(size: 12, weight: Font.Weight.bold, design: Font.Design.default))
                        .foregroundColor(Color.black)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                Image(systemName: "flag.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .foregroundStyle(.green)
            }
            .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
            .frame(height: 108)
            .background(Color.white)
            .cornerRadius(18)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color.blue, lineWidth: 1)
            )
        }
    }
}

struct BeachesListItemView_Previews: PreviewProvider {
    static var previews: some View {
        BeachesListItemView(beachName: "Kontxa")
            .previewLayout(.sizeThatFits)
    }
}
