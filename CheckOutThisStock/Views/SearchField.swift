//
//  SearchField.swift
//  newProject
//
//  Created by MAC on 15/11/2021.
//

import SwiftUI

struct SearchField: View {
    @Binding var text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 360, height: 50, alignment: .center)
                .foregroundColor(Color("SearchField"))
            HStack {
                TextField("Search for stock", text: $text)
                    .frame(width: 300, height: 50
                           , alignment: .center)
                Image(systemName: "magnifyingglass")
    
            }
            
        }
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField(text: .constant(""))
    }
}
