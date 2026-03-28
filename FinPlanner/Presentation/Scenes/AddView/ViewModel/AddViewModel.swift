//
//  AddViewModel.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import SwiftUI
import Combine

class AddViewModel: ObservableObject {
	private let createUseCase: CreatePaymentUseCase
	init(createUseCase: CreatePaymentUseCase) {
		self.createUseCase = createUseCase
	}
	
	@Published var isNotificationSelected = false
	@Published var payType: PayType = .monthly
	@Published var isShowCalendar = false
	@Published var isAdded: Bool = false
	
	// Fields
	@Published var paymentName: String = ""
	@Published var description: String = ""
	@Published var paymentAmount: String = ""
	@Published var totalAmount: String = ""
	@Published var remainingAmount: String = ""
	@Published var date: Date = .now
	
	func createNewPayment() {
		// Validations
		do {
			var lastPayDate: Date? = nil
			if payType == .monthly {
				lastPayDate = Date.now
			}
			try createUseCase.execute(payment: Payment(id: UUID().uuidString,
													   type: payType,
													   title: paymentName,
													   description: description,
													   paymentAmount: Decimal(string: paymentAmount) ?? .zero,
													   totalAmount: Decimal(string: totalAmount) ?? .zero,
													   remainingAmount: Decimal(string: totalAmount) ?? .zero,
													   dueDay: date.day,
													   dueDate: date,
													   isNotificationEnable: isNotificationSelected,
													   createdAt: .now,
													   lastPay: lastPayDate))
			isAdded.toggle()
		} catch {
			print(error.localizedDescription)
		}
	}
}

