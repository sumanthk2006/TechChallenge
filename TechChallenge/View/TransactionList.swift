//
//  TransactionList.swift
//  TechChallenge
//
//  Created by Sumanth Koduganti on 27/06/2022.
//

import Foundation

class TransactionList: ObservableObject {
    @Published var list = ModelData.sampleTransactions
}


extension Array where Element == TransactionModel {
    
    func transactionsFor(selectedCategory: TransactionModel.Category, includeOnlyPinned: Bool = false ) -> [Element] {
        self.filter { ($0.category == selectedCategory || selectedCategory == .all) && (includeOnlyPinned ? $0.isPinned : true)}
    }
    
    func transactionsTotalFor(selectedCategory: TransactionModel.Category) -> String {
        let formatter = NumberFormatter()
        formatter.currencyCode = "$"
        formatter.numberStyle = .currency
        let totalAmount = totalTransactionsAmountFor(selectedCategory: selectedCategory, includeOnlyPinned: true)
        return formatter.string(from: NSNumber(value: totalAmount)) ?? ""
    }
    
    func totalTransactionsAmountFor(selectedCategory: TransactionModel.Category, includeOnlyPinned: Bool = false) -> Double {
        let transactions = transactionsFor(selectedCategory: selectedCategory, includeOnlyPinned: includeOnlyPinned)
        let totalAmount = transactions.reduce(0) { partialResult, model in
            partialResult + model.amount
        }
        return totalAmount
    }
    
    func ratioFor(selectedCategory: TransactionModel.Category, includeOnlyPinned: Bool = false) -> Double {
        totalTransactionsAmountFor(selectedCategory: selectedCategory, includeOnlyPinned: includeOnlyPinned)
        / totalTransactionsAmountFor(selectedCategory: .all, includeOnlyPinned: includeOnlyPinned)
    }
}
