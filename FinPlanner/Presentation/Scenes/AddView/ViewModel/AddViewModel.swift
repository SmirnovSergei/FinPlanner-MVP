//
//  AddViewModel.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import SwiftUI
import Combine

@MainActor
class AddViewModel: ObservableObject {
	private let createUseCase: CreatePaymentUseCase
	private let notificationUseCase: NotificationUseCase
	
	init(createUseCase: CreatePaymentUseCase, notificationUseCase: NotificationUseCase) {
		self.createUseCase = createUseCase
		self.notificationUseCase = notificationUseCase
	}
	
	@Published var isNotificationSelected = false
	@Published var payType: PayType = .monthly
	@Published var isShowCalendar = false
	@Published var isAdded: Bool = false
	@Published var isClose: Bool = false
	@Published var isShowedNotificationAlert = false
	
	// Fields
	@Published var paymentName: String = ""
	@Published var description: String = ""
	@Published var paymentAmount: String = ""
	@Published var totalAmount: String = ""
	@Published var remainingAmount: String = ""
	@Published var date: Date = .now
	
	var isFormValid: Bool {
		// 1. Название
		guard paymentName.count >= 2 else { return false}
		
		// 2. Общая сумма
		guard let total = Double(totalAmount), total > 0 else { return false }
		
		// 3. Ежемесячный платеж
		if payType == .monthly {
			guard let monthly = Double(paymentAmount), monthly > 0 else {
				return false
			}
		}
		
		// 4. Описание - опционально
		return true
	}
	
	func createNewPayment() {
		// Validations
		do {
			var lastPayDate: Date? = nil
			if payType == .monthly {
				lastPayDate = Date.now
			}
			let paymentID = UUID().uuidString
			
			if isNotificationSelected {
				addNotification(item: NotificationItem(id: paymentID, date: date, amount: paymentAmount, type: payType)) { [weak self] isError in
					guard let self = self else { return }
					self.isShowedNotificationAlert = true
					print("Нет досутпа к уведомлениям")
					self.isNotificationSelected = false
				}
			}
			
			try createUseCase.execute(payment: Payment(id: paymentID,
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
													   lastPay: lastPayDate,
													   isClose: isClose,
													   closeDate: .now)
			)

			isAdded.toggle()
		} catch {
			print(error.localizedDescription)
		}
	}
	
	private func addNotification(item: NotificationItem, completion: @escaping (Bool) -> Void) {
		notificationUseCase.exeute(create: item) { isError in
			if isError {
				completion(isError)
			}
		}
	}
}

