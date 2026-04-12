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
	@Published var isShowedNotificationAlert: Bool = false
	
	private let deleteUseCase: DeletePaymentUseCase
	private let updateUseCase: UpdatePaymentUseCase
	private let notificationUseCase: NotificationUseCase
	var payment: Payment
	
	init(deleteUseCase: DeletePaymentUseCase, updateUseCase: UpdatePaymentUseCase, notificationUseCase: NotificationUseCase, payment: Payment) {
		self.deleteUseCase = deleteUseCase
		self.updateUseCase = updateUseCase
		self.notificationUseCase = notificationUseCase
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
			if newValue {
				notificationUseCase.exeute(create: NotificationItem(id: payment.id, date: payment.dueDate ?? .now, amount: payment.paymentAmount.formattedWithoutDecimals, type: payment.type)) { [weak self] isError in
					guard let self = self else { return }
					self.isShowedNotificationAlert = true
					print("Нет досутпа к уведомлениям")
				}
			} else {
				notificationUseCase.execute(delete: payment.id)
			}
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
