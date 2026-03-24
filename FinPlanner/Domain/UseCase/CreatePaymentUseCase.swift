//
//  CreatePaymentUseCase.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import Foundation

protocol CreatePaymentUseCase: AnyObject {
	func execute(payment: Payment) throws
}

class CreateUseCaseImp: CreatePaymentUseCase {
	private let repository: CreatePaymentRepository
	
	init(repository: CreatePaymentRepository) {
		self.repository = repository
	}
	
	func execute(payment: Payment) throws {
		try repository.createPayment(payment: payment)
	}
	
	
}
