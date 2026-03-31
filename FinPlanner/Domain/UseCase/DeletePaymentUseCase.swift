//
//  DeletePaymentUseCase.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 31.03.2026.
//

import Foundation

protocol DeletePaymentUseCase: AnyObject {
	func execute(payment: Payment) throws
}

class DeletePaymentUseCaseImp: DeletePaymentUseCase {
	private let repo: DeletePaymentRepository
	
	init(repo: DeletePaymentRepository) {
		self.repo = repo
	}
	
	func execute(payment: Payment) throws {
		try repo.deletePayment(payment: payment)
	}
}
