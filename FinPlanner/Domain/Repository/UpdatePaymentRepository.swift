//
//  UpdatePaymentRepository.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 31.03.2026.
//

import Foundation

protocol UpdatePaymentRepository: AnyObject {
	func updateNotification(payment: Payment, notificationIsOn: Bool) throws
	func closePayment(payment: Payment) throws
	func deleteLastPayment(payment: Payment) throws
}
