//
//  Foundation.swift
//  Easy Budget 1
//
//  Created by 高铭阳 on 10/20/24.
//

import Foundation

//struct Income: Identifiable {
//    let id = UUID() // Unique identifier for each transaction
//    var description: String
//    var amount: Double
//}
//
//struct Expense: Identifiable {
//    let id = UUID() // Unique identifier for each transaction
//    var description: String
//    var amount: Double
//}

struct Transaction: Identifiable {
    let id = UUID()
    var description: String
    var amount: Double
    var isIncome: Bool
    var timestamp: Date
}
