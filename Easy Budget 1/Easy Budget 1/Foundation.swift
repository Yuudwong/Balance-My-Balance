// All the declarations of structures and classes
import SwiftUI
import Foundation

struct Transaction: Identifiable, Codable {
    var id = UUID()
    var description: String
    var amount: Double
    var isIncome: Bool
    var timestamp: Date
    
    // 仅保留日期部分
    var dateOnly: Date {
        Calendar.current.startOfDay(for: timestamp)
    }
    
    init(id: UUID = UUID(), description: String, amount: Double, isIncome: Bool, timestamp: Date) {
        self.id = id
        self.description = description
        self.amount = amount
        self.isIncome = isIncome
        self.timestamp = timestamp
    }
}

// Struct for grouping transactions by date
struct TransactionDateGroup: Identifiable {
    let id = UUID()
    let date: Date
    let transactions: [Transaction]
}

class Account: Identifiable, ObservableObject{
    let id = UUID()
    @Published var icon: String
    @Published var name: String
    @Published var transactions: [Transaction] = []
    @Published var yearlyBudget: [Int: Double] = [:]
    @Published var monthlyBudget: [Int: Double] = [:]
    @Published var weeklyBudget: [Int: Double] = [:]
    @Published var selectedYear: Int = Calendar.current.component(.year, from: Date())
    @Published var selectedMonth: Int? = Calendar.current.component(.month, from: Date())
    @Published var selectedWeek: Int? = Calendar.current.component(.weekOfYear, from: Date())
    @Published var selectedDisplayType: String = "Balance"
    
    init(name: String) {
        self.name = name
        self.transactions = []
        self.icon = "💳"
    }
}
