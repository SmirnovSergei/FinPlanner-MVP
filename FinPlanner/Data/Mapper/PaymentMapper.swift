//
//  PaymentMapper.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import Foundation
import CoreData

struct PaymentMapper {
	static func toDomain(from entitie: PaymentEntity) -> Payment {
		let payment = Payment(id: entitie.id ?? "",
							  type: PayType(rawValue: Int(entitie.type)) ?? .monthly,
							  title: entitie.title ?? "",
							  description: entitie.descriptionText ?? "",
							  paymentAmount: entitie.paymentAmount?.decimalValue ?? .zero,
							  totalAmount: entitie.totalAmount?.decimalValue ?? .zero,
							  remainingAmount: entitie.remainingAmount?.decimalValue ?? .zero,
							  dueDay: Int(entitie.dueDay),
							  dueDate: entitie.dueDate,
							  isNotificationEnable: entitie.isNotificationEnable,
							  createdAt: entitie.createdAt ?? .now,
							  lastPay: entitie.lastPay)
		return payment
	}
	
	static func toEntitie(from: Payment, context: NSManagedObjectContext) -> PaymentEntity {
		let entitie = PaymentEntity(context: context)
		entitie.id = from.id
		entitie.type = Int16(from.type.rawValue)
		entitie.title = from.title
		entitie.descriptionText = from.description
		entitie.paymentAmount = NSDecimalNumber(decimal: from.paymentAmount)
		entitie.totalAmount = NSDecimalNumber(decimal: from.totalAmount)
		entitie.remainingAmount = NSDecimalNumber(decimal: from.remainingAmount)
		entitie.dueDay = Int16(from.dueDay ?? 0)
		entitie.dueDate = from.dueDate
		entitie.isNotificationEnable = from.isNotificationEnable
		entitie.createdAt = from.createdAt
		entitie.lastPay = from.lastPay
		return entitie
	}
}

