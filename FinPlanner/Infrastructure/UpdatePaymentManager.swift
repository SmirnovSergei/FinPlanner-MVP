//
//  UpdatePaymentManager.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 31.03.2026.
//

import Foundation
import CoreData

class UpdatePaymentManager: UpdatePaymentDataSource {
	let context = PersistentContainer.shared.persistentContainer.viewContext
	
	func updatePayment(payment: Payment, notificationIsOn: Bool) throws {
		if let currentPayment = searchPayment(paymentId: payment.id) {
			currentPayment.isNotificationEnable = notificationIsOn
			try context.save()
		} else {
			throw NSError(domain: "Ошибка поиска по id \(payment.id)", code: 0)
		}
	}
	
	func closePayment(payment: Payment) throws {
		if let currentPayment = searchPayment(paymentId: payment.id) {
			currentPayment.isClose = true
			try context.save()
		} else {
			throw NSError(domain: "Ошибка поиска по id \(payment.id)", code: 0)
		}
	}
	
	func deletePayment(payment: Payment) throws {
		if let currentPayment = searchPayment(paymentId: payment.id) {
			currentPayment.lastPay = Date().minusMonth(value: 1)
			try context.save()
		} else {
			throw NSError(domain: "Ошибка поиска по id \(payment.id)", code: 0)
		}
	}
	
	private func searchPayment(paymentId: String) -> PaymentEntity? {
		let req = PaymentEntity.fetchRequest()
		req.predicate = NSPredicate(format: "id == %@", paymentId)
		
		if let payments = try? context.fetch(req), let currentPayment = payments.first {
			return currentPayment
		}
		
		return nil
	}
}
