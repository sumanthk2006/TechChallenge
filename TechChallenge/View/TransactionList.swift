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
