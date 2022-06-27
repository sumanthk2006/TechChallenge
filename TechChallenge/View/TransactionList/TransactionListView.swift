//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    @State private var selectedCategory = TransactionModel.Category.all
    
    @EnvironmentObject private var transactions: TransactionList
    
    var body: some View {
        
        VStack {
            CategoriesListView(selectedCategory: $selectedCategory)
            List {
                ForEach(transactions.list.transactionsFor(selectedCategory: selectedCategory)) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .animation(.default, value: getTransaction(for: selectedCategory))
            .listStyle(PlainListStyle())
            
            TotalAmountView(selectedCategory: $selectedCategory)
                .frame(maxWidth:.infinity)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(NSLocalizedString("Transactions", comment: ""))
        }
    }
    
    
    func getTransaction(for category: TransactionModel.Category) -> [TransactionModel] {
        transactions.list.filter { $0.category == category || category == .all}
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
