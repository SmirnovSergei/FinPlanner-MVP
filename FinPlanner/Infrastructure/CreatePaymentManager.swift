//
//  CreatePaymentManager.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import Foundation
import CoreData

class CreatePaymentManager: CreatePaymentDataSource {
	let context = PersistentContainer.shared.persistentContainer.viewContext
	
	func createNewPayment(payment: Payment) throws {
		let _ = PaymentMapper.toEntitie(from: payment, context: context)
		try context.save()
	}
}
