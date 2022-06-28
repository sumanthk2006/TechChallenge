//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    @State private var selectedCategory: TransactionModel.Category
    
    @EnvironmentObject private var transactions: TransactionList
    
    init(selectedCategory: TransactionModel.Category = .all) {
        self.selectedCategory = selectedCategory
    }
    
    var body: some View {
        VStack {
            CategoriesListView(selectedCategory: $selectedCategory)
            List {
                ForEach(transactions.list.transactionsFor(selectedCategory: selectedCategory)) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .animation(.default)
            .listStyle(PlainListStyle())
            
            TotalAmountView(selectedCategory: $selectedCategory)
                .frame(maxWidth:.infinity)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(NSLocalizedString("Transactions", comment: ""))
        }
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
            .environmentObject(TransactionList())
    }
}
#endif
