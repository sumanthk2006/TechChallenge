//
//  TestModalData.swift
//  TechChallengeTests
//
//  Created by Sumanth Koduganti on 28/06/2022.
//

import Foundation
@testable import TechChallenge

struct TestModelData {
    private static let accountNames = ["Online Savings", "Checking Account", "Credit Card"]
    
    private static var accountName: String {
        accountNames.first ?? "Unknown"
    }
    
    static let sampleTransactions: [TransactionModel] = [
        TransactionModel(
            id: 1,
            name: "Movie Night",
            category: .entertainment,
            amount: 82.99,
            date: Date(string: "2021-03-05")!,
            accountName: accountName,
            provider: .timeWarner
        ),
        TransactionModel(
            id: 2,
            name: "Jeans",
            category: .shopping,
            amount: 54.60,
            date: Date(string: "2021-04-25")!,
            accountName: accountName,
            provider: .jCrew
        ),
        TransactionModel(
            id: 3,
            name: "Salad Mix",
            category: .food,
            amount: 25.32,
            date: Date(string: "2021-04-15")!,
            accountName: accountName,
            provider: .wendys
        ),
        TransactionModel(
            id: 4,
            name: "Lunch Special",
            category: .food,
            amount: 10.36,
            date: Date(string: "2021-04-12")!,
            accountName: accountName,
            provider: .burgerKing
        ),
        TransactionModel(
            id: 5,
            name: "Airport ride",
            category: .travel,
            amount: 54.28,
            date: Date(string: "2021-04-02")!,
            accountName: accountName,
            provider: .uber
        ),
        TransactionModel(
            id: 6,
            name: "Monthly Best Seller",
            category: .shopping,
            amount: 6.51,
            date: Date(string: "2021-04-22")!,
            accountName: accountName,
            provider: .amazon
        ),
        TransactionModel(
            id: 7,
            name: "Triple Spice Souce",
            category: .food,
            amount: 12.76,
            date: Date(string: "2021-04-22")!,
            accountName: accountName,
            provider: .traderJoes
        ),
        TransactionModel(
            id: 8,
            name: "Meds",
            category: .health,
            amount: 21.53,
            date: Date(string: "2021-04-04")!,
            accountName: accountName,
            provider: .cvs
        ),
        TransactionModel(
            id: 9,
            name: "Potato Snack",
            category: .food,
            amount: 15.95,
            date: Date(string: "2021-04-19")!,
            accountName: accountName,
            provider: .wawa
        ),
        TransactionModel(
            id: 10,
            name: "Refuel",
            category: .travel,
            amount: 44.22,
            date: Date(string: "2021-04-21")!,
            accountName: accountName,
            provider: .exxonmobil
        ),
        TransactionModel(
            id: 11,
            name: "Matcha Latte",
            category: .food,
            amount: 9.89,
            date: Date(string: "2021-04-27")!,
            accountName: accountName,
            provider: .starbucks
        ),
        TransactionModel(
            id: 12,
            name: "Riders Cap",
            category: .shopping,
            amount: 16.89,
            date: Date(string: "2021-04-26")!,
            accountName: accountName,
            provider: .jCrew
        ),
        TransactionModel(
            id: 13,
            name: "Outbound Trip",
            category: .travel,
            amount: 116.78,
            date: Date(string: "2021-04-30")!,
            accountName: accountName,
            provider: .americanAirlines
        )
    ]
}
