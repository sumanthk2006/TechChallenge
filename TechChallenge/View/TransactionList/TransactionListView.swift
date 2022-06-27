//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    @State var selectedCategory = TransactionModel.Category.all
    
    @EnvironmentObject var transactions: TransactionList
    
    var body: some View {
        
        VStack {
            CategoriesListView(selectedCategory: $selectedCategory)
            List {
                ForEach(getTransaction(for: selectedCategory)) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .animation(.default)
            .listStyle(PlainListStyle())
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
    }
}
#endif
