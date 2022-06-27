//
//  CategoryView.swift
//  TechChallenge
//
//  Created by Sumanth Koduganti on 27/06/2022.
//

import SwiftUI

struct CategoryView: View {
    
    @Binding var selectedCategory: TransactionModel.Category
    let category: TransactionModel.Category
    
    var body: some View {
        Button {
            withAnimation {
                self.selectedCategory = category
            }
        } label: {
                Text(category.rawValue)
                    .fontWeight(.bold)
                    .font(.system(.title2))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    .background(category.color)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20, style: .circular)
                    )
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(selectedCategory: .constant(.all), category: .entertainment)
    }
}
