//
//  TotalAmount.swift
//  TechChallenge
//
//  Created by Sumanth Koduganti on 27/06/2022.
//

import SwiftUI

struct TotalAmountView: View {
    @Binding var selectedCategory: TransactionModel.Category
    @EnvironmentObject private var transactions: TransactionList

    @Namespace var totalAmountNameSpace
    var body: some View {
        HStack  {
            
            VStack(alignment: .trailing) {
                Text(selectedCategory.rawValue)
                    .foregroundColor(selectedCategory.color)
                    .font(.headline)
                
                HStack {
                    Text(NSLocalizedString("Total spent:", comment: ""))
                    Spacer()
                    Text(transactions.list.transactionsTotalFor(selectedCategory: selectedCategory))
                        .primary()
                        .matchedGeometryEffect(id: "totalAmount", in: totalAmountNameSpace)
                }
            }
            
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 10, style: .circular).stroke(Color.accentColor, lineWidth: 2))
    }
}

struct TotalAmount_Previews: PreviewProvider {
    static var previews: some View {
        TotalAmountView(selectedCategory: .constant(.all))
            .environmentObject(TransactionList())
        
    }
}
