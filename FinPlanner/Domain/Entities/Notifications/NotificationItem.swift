//
//  NotificationItem.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 01.04.2026.
//

import Foundation

struct NotificationItem: Identifiable {
	let id: String
	let date: Date
	let amount: String
	let type: PayType
}

