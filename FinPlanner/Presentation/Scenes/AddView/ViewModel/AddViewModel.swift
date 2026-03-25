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
			try createUseCase.execute(payment: Payment(id: UUID().uuidString,
													   type: payType,
													   title: paymentName,
													   description: description,
													   paymentAmount: Decimal(string: paymentAmount) ?? 0,
													   totalAmount: Decimal(string: totalAmount) ?? 0,
													   remainingAmount: Decimal(string: remainingAmount) ?? 0,
													   dueDay: date.day,
													   dueDate: date,
													   isNotificationEnable: isNotificationSelected,
													   createdAt: .now,
													   lastPay: date))
			isAdded.toggle()
		} catch {
			print(error.localizedDescription)
		}
	}
}

