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
		var payment = Payment(id: entitie.id ?? "",
							  type: PayType(rawValue: Int(entitie.type)) ?? .monthly,
							  title: entitie.title ?? "",
							  description: entitie.descriptionText ?? "",
							  paymentAmount: entitie.paymentAmount,
							  totalAmount: entitie.totalAmount,
							  isNotificationEnable: entitie.isNotificationEnable,
							  createdAt: entitie.createdAt ?? .now)
		return payment
	}
	
	static func toEntitie(from: Payment, context: NSManagedObjectContext) -> PaymentEntity {
		let entitie = PaymentEntity(context: context)
		entitie.id = from.id
		entitie.type = Int16(from.type.rawValue)
		entitie.title = from.title
		entitie.descriptionText = from.description
		entitie.paymentAmount = from.paymentAmount
		entitie.totalAmount = from.totalAmount
		entitie.isNotificationEnable = from.isNotificationEnable
		entitie.createdAt = from.createdAt
		return entitie
	}
}
