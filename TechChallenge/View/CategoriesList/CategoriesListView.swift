//
//  CategoriesListView.swift
//  TechChallenge
//
//  Created by Sumanth Koduganti on 27/06/2022.
//

import SwiftUI

struct CategoriesListView: View {
    
    @Binding var selectedCategory: TransactionModel.Category
    let categories = TransactionModel.Category.allCases
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(categories) { category in
                    CategoryView(selectedCategory: $selectedCategory, category: category)
                }
            }
            .padding(15)
        }
        .background(Color.accentColor.opacity(0.8))
    }
}

struct CategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListView(selectedCategory: .constant(.all))
    }
}
