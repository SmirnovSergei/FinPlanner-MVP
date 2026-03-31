//
//  UpdatePaymentRepositoryImp.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 31.03.2026.
//

import Foundation

class UpdatePaymentRepositoryImp: UpdatePaymentRepository {
	private let dataSource: UpdatePaymentDataSource
	
	init(dataSource: UpdatePaymentDataSource) {
		self.dataSource = dataSource
	}
	
	func updateNotification(payment: Payment, notificationIsOn: Bool) throws {
		try dataSource.updatePayment(payment: payment, notificationIsOn: notificationIsOn)
	}
	
	func closePayment(payment: Payment) throws {
		try dataSource.closePayment(payment: payment)
	}
	
	func deleteLastPayment(payment: Payment) throws {
		try dataSource.deletePayment(payment: payment)
	}
	

}
