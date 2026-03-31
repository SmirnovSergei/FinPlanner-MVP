//
//  FetchPaymentManager.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 25.03.2026.
//

import Foundation
import CoreData

class FetchPaymentManager: FetchPaymentDataSource {
	let context = PersistentContainer.shared.persistentContainer.viewContext
	
	func fetchPayments(date: Date?, completion: (Result<[Payment], any Error>) -> Void) throws {
		let req = PaymentEntity.fetchRequest()
		if let date {
			req.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
				NSPredicate(format: "lastPay >= %@ AND lastPay < %@",
							date.startOfMonth as NSDate,
							date.endOfMonth as NSDate),
//				NSPredicate(format: "isClose == NO")
			])
		} else {
			req.predicate = NSPredicate(format: "isClose == NO")
		}
		
		req.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: false)]
		let payments = try context.fetch(req)
		
		let domainPayments = payments.map { item in
			PaymentMapper.toDomain(from: item)
		}
		completion(.success(domainPayments))
	}
}
