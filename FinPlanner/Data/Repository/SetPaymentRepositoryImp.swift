//
//  SetPaymentRepositoryImp.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 26.03.2026.
//

import Foundation

class SetPaymentRepositoryImp: SetPaymentRepository {
	private let dataSource: SetPaymentDataSource
	
	init(dataSource: SetPaymentDataSource) {
		self.dataSource = dataSource
	}
	
	func setPayment(payment: Payment) throws {
		try dataSource.setPayment(payment: payment)
	}
}
