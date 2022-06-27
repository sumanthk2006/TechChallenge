//
//  InsightsView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 29/7/21.
//

import SwiftUI

struct InsightsView: View {
    @EnvironmentObject private var transactions: TransactionList
    let categories = TransactionModel.Category.allCases.filter {$0 != .all}
    
    var body: some View {
        List {
            RingView()
                .scaledToFit()
            
            ForEach(categories) { category in
                HStack {
                    Text(category.rawValue)
                        .font(.headline)
                        .foregroundColor(category.color)
                    Spacer()
                    Text(transactions.list.transactionsTotalFor(selectedCategory: category))
                        .bold()
                        .secondary()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Insights")
    }
}

#if DEBUG
struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView()
            .previewLayout(.sizeThatFits)
    }
}
#endif
