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

class PersistentContainer {
	static let shared = PersistentContainer()
	private init() {}
	lazy var persistentContainer: NSPersistentContainer = {
		
		let container = NSPersistentContainer(name: "db")
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		return container
	}()
}
