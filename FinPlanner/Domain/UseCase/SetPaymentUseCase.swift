//
//  SetPaymentUseCase.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 26.03.2026.
//

import Foundation

protocol SetPaymentUseCase: AnyObject {
	func execute(payment: Payment) throws
}

class SetPaymentUseCaseImp: SetPaymentUseCase {
	private var repository: SetPaymentRepository
	
	init(repository: SetPaymentRepository) {
		self.repository = repository
	}
	
	func execute(payment: Payment) throws {
		try repository.setPayment(payment: payment)
	}
	
	
}
