//
//  UpdatePaymentDataSource.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 31.03.2026.
//

import Foundation

protocol UpdatePaymentDataSource: AnyObject {
	func updatePayment(payment: Payment, notificationIsOn: Bool) throws
	func closePayment(payment: Payment) throws
	func deletePayment(payment: Payment) throws
}
