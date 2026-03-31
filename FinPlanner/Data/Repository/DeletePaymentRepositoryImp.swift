//
//  DeletePaymentRepositoryImp.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 31.03.2026.
//

import Foundation

class DeletePaymentRepositoryImp: DeletePaymentRepository {
	private var dataSource: DeletePaymentDataSource
	
	init(dataSource: DeletePaymentDataSource) {
		self.dataSource = dataSource
	}
	
	func deletePayment(payment: Payment) throws {
		try dataSource.deletePayment(payment: payment)
	}
}
