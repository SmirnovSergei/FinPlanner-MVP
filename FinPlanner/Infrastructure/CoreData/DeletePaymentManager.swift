//
//  DeletePaymentManager.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 31.03.2026.
//

import Foundation
import CoreData

class DeletePaymentManager: DeletePaymentDataSource {
	let context = PersistentContainer.shared.persistentContainer.viewContext
	
	func deletePayment(payment: Payment) throws {
		let req = PaymentEntity.fetchRequest()
		req.predicate = NSPredicate(format: "id == %@", payment.id)
		
		if let payments = try? context.fetch(req), let currentPayment = payments.first {
			context.delete(currentPayment)
			try context.save()
		}
	}
}
