//
//  TechChallengeTests.swift
//  TechChallengeTests
//
//  Created by Adrian Tineo Cabello on 30/7/21.
//

import XCTest
@testable import TechChallenge

class TechChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
//    MARK: - Filtering transactions tests
    func testTransactionListFilter() {
        let transactionList = TransactionList()
        let foodTransactions = transactionList.list.transactionsFor(selectedCategory: .health)
        XCTAssertNotNil(foodTransactions)
        XCTAssertEqual(foodTransactions.count, 1)
    }
    
    func testTransactionArrayFilter() {
        let transactionList = [
            TransactionModel(
                id: 1,
                name: "Movie Night",
                category: .entertainment,
                amount: 82.99,
                date: Date(string: "2021-03-05")!,
                accountName: "Account 1",
                provider: .timeWarner
            ),
            TransactionModel(
                id: 2,
                name: "Jeans",
                category: .shopping,
                amount: 54.60,
                date: Date(string: "2021-04-25")!,
                accountName: "Account 2",
                provider: .jCrew
            )
        ]
        XCTAssertEqual(transactionList.count, 2)
        let filteredTransaction = transactionList.transactionsFor(selectedCategory: .entertainment)
        XCTAssertNotNil(filteredTransaction)
        XCTAssertEqual(filteredTransaction.count, 1)
        XCTAssertEqual(TransactionModel(
            id: 1,
            name: "Movie Night",
            category: .entertainment,
            amount: 82.99,
            date: Date(string: "2021-03-05")!,
            accountName: "Account 1",
            provider: .timeWarner
        ), filteredTransaction.first!)
    }
    
    
//    MARK: - Sum of transaction tests
    
    func testTotalSumOfTransactionsForAll() {
        let transactionList = TransactionList()
        var transactionsTotal = transactionList.list.totalTransactionsAmountFor(selectedCategory: .all, includeOnlyPinned: true)
        XCTAssertEqual(transactionsTotal.formatted(hasDecimals: true), "472.08")
        
        transactionList.list[0].isPinned.toggle()
        
        transactionsTotal = transactionList.list.totalTransactionsAmountFor(selectedCategory: .all, includeOnlyPinned: false)
        XCTAssertEqual(transactionsTotal.formatted(hasDecimals: true), "472.08")

        transactionsTotal = transactionList.list.totalTransactionsAmountFor(selectedCategory: .all)
        XCTAssertEqual(transactionsTotal.formatted(hasDecimals: true), "472.08")
        
        transactionsTotal = transactionList.list.totalTransactionsAmountFor(selectedCategory: .all, includeOnlyPinned: true)
        XCTAssertEqual(transactionsTotal.formatted(hasDecimals: true), "389.09")
    }
    
    func testTotalSumOfTransactionForCategory() {
        let transactionList = TransactionList()
        var transactionTotal = transactionList.list.totalTransactionsAmountFor(selectedCategory: .shopping, includeOnlyPinned: true)
        XCTAssertEqual(transactionTotal.formatted(hasDecimals: true), "78.00")
        
        transactionList.list[1].isPinned.toggle()
        
        transactionTotal = transactionList.list.totalTransactionsAmountFor(selectedCategory: .shopping, includeOnlyPinned: false)
        XCTAssertEqual(transactionTotal.formatted(hasDecimals: true), "78.00")

        
        transactionTotal = transactionList.list.totalTransactionsAmountFor(selectedCategory: .shopping, includeOnlyPinned: true)
        XCTAssertEqual(transactionTotal.formatted(hasDecimals: true), "23.40")
    }
    
//    MARK: Ratio percentage tests
    func testRatioPercentageOfTransactionInCategory() {
        let transactionList = TransactionList()
        var transactionRatio = transactionList.list.ratioFor(selectedCategory: .shopping)
        XCTAssertEqual(transactionRatio.formatted(hasDecimals: true), "0.17")
        
        transactionList.list[1].isPinned.toggle()
        
        transactionRatio = transactionList.list.ratioFor(selectedCategory: .shopping, includeOnlyPinned: true)
        XCTAssertEqual(transactionRatio.formatted(hasDecimals: true), "0.06")
    }
}
