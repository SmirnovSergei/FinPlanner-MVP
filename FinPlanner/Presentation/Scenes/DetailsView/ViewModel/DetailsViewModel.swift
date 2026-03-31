//
//  DetailsViewModel.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 28.03.2026.
//

import Foundation
import Combine

class DetailsViewModel: ObservableObject {
	@Published var isNotificationSelected: Bool = false {
		willSet {
			self.updateNotiication(newValue)
		}
	}
	
	private let deleteUseCase: DeletePaymentUseCase
	private let updateUseCase: UpdatePaymentUseCase
	var payment: Payment
	
	init(deleteUseCase: DeletePaymentUseCase, updateUseCase: UpdatePaymentUseCase, payment: Payment) {
		self.deleteUseCase = deleteUseCase
		self.updateUseCase = updateUseCase
		self.payment = payment
		self.isNotificationSelected = payment.isNotificationEnable
	}
	
	func delete() {
		do {
			try deleteUseCase.execute(payment: payment)
		} catch {
			print(error)
		}
	}
	
	func updateNotiication(_ newValue: Bool) {
		do {
			try updateUseCase.execute(update: payment, notificationIsOn: newValue)
		} catch {
			print(error)
		}
	}
	
	func close() {
		do {
			try updateUseCase.execute(close: payment)
		} catch {
			print(error)
		}
	}
	
	func deleteLastPayment() {
		do {
			try updateUseCase.execute(delete: payment)
		} catch {
			print(error)
		}
	}
}
