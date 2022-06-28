//
//  TechChallengeSnapShotTests.swift
//  TechChallengeTests
//
//  Created by Sumanth Koduganti on 28/06/2022.
//

import XCTest
import SnapshotTesting
@testable import TechChallenge
import SwiftUI

class TechChallengeSnapShotTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        isRecording = true
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTransactionList() {
        let transactionList = TransactionList()
        transactionList.list = TestModelData.sampleTransactions
        
        let view = TransactionListView().environmentObject(transactionList)
        let hostingController = UIHostingController(rootView: view)
        hostingController.view.frame = UIScreen.main.bounds

        
        generateScreenshotsForViewController(hostingController, name: "TransactionListView")
    }
    
    func testTransactionListForCategory() {
        let transactionList = TransactionList()
        transactionList.list = TestModelData.sampleTransactions
        
        let view = TransactionListView(selectedCategory: .food).environmentObject(transactionList)
        let hostingController = UIHostingController(rootView: view)
        hostingController.view.frame = UIScreen.main.bounds

        
        generateScreenshotsForViewController(hostingController, name: "TransactionListViewForCategory")
    }
    
    func testInsightsView() {
        let transactionList = TransactionList()
        transactionList.list = TestModelData.sampleTransactions
        
        let view = InsightsView().environmentObject(transactionList)
        let hostingController = UIHostingController(rootView: view)
        hostingController.view.frame = UIScreen.main.bounds
        generateScreenshotsForViewController(hostingController, name: "InsightsView")
    }
    
    private func generateScreenshotsForViewController(_ viewController: UIViewController, name: String) {
        func generateSnapshots(name: String, traitMode: UITraitCollection) {
            assertSnapshot(matching: viewController, as: .image(precision: 1.0, traits: traitMode), testName: name)
        }
        
        let lightModeTraitCollection = UITraitCollection(userInterfaceStyle: .light)
        generateSnapshots(name: "light_\(name)", traitMode: lightModeTraitCollection)
    }
}



