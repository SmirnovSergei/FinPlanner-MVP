//
//  Payment.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import SwiftUI

struct Payment: Identifiable, Hashable {
	let id: String
	let type: PayType
	var title: String
	var description: String
	var paymentAmount: Decimal
	var totalAmount: Decimal
	var remainingAmount: Decimal
	var dueDay: Int?
	var dueDate: Date?
	var isNotificationEnable: Bool
	var createdAt: Date
	var lastPay: Date?
}
