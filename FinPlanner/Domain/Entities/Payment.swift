//
//  Payment.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import SwiftUI

struct Payment: Identifiable {
	let id: String
	let type: PayType
	var title: String
	var description: String
	var paymentAmount: Double
	var totalAmount: Double
	var dueDay: Int?
	var dueDate: Date?
	var isNotificationEnable: Bool
	var createdAt: Date
}
