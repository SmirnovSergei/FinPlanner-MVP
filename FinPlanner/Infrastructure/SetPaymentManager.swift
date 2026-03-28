//
//  SetPaymentManager.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 26.03.2026.
//

import Foundation
import CoreData

class SetPaymentManager: SetPaymentDataSource {

	let context = PersistentContainer.shared.persistentContainer.viewContext
	func setPayment(payment: Payment) throws {
		let req = PaymentEntity.fetchRequest()
		req.predicate = NSPredicate(format: "id == %@", payment.id)
		
		let payments = try context.fetch(req)
		if let contextPayment = payments.first {
			contextPayment.lastPay = .now

			if contextPayment.type == 0 {
				var remainingAmount = contextPayment.remainingAmount?.decimalValue ?? .zero
				let paymentAmount = contextPayment.paymentAmount?.decimalValue ?? .zero
				remainingAmount -= paymentAmount
				
				if remainingAmount < 0 {
					contextPayment.remainingAmount = .zero
				} else {
					contextPayment.remainingAmount = NSDecimalNumber(decimal: remainingAmount)
				}
			} else {
				contextPayment.remainingAmount = .zero
				contextPayment.isNotificationEnable = false
			}
			try context.save()
		}
	}
}
