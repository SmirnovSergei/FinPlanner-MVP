//
//  CreatePaymentRepositoryImp.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import Foundation

class CreatePaymentRepositoryImp: CreatePaymentRepository {
	private let dataSource: CreatePaymentDataSource
	
	init(dataSource: CreatePaymentDataSource) {
		self.dataSource = dataSource
	}
	
	func createPayment(payment: Payment) throws {
		try dataSource.createNewPayment(payment: payment)
	}
	
	
}
