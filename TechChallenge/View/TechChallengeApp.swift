//
//  TechChallengeApp.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

@main
struct TechChallengeApp: App {
    @StateObject var transactionList = TransactionList()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    TransactionListView()
                }
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
                }
                .environmentObject(transactionList)
                .navigationViewStyle(.stack)
                
                NavigationView {
                    InsightsView()
                }
                .tabItem {
                    Label("Insights", systemImage: "chart.pie.fill")
                }
                .environmentObject(transactionList)
                .navigationViewStyle(.stack)
            }
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        }
    }
}


