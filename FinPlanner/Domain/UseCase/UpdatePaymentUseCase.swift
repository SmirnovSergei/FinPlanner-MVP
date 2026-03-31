//
//  UpdatePaymentUseCase.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 31.03.2026.
//

import Foundation

protocol UpdatePaymentUseCase: AnyObject {
	func execute(update forUpdate: Payment, notificationIsOn: Bool) throws
	func execute(close forClose: Payment) throws
	func execute(delete forDelete: Payment) throws
}

class UpdatePaymentUseCaseImp: UpdatePaymentUseCase {
	private let repo: UpdatePaymentRepository
	
	init(repo: UpdatePaymentRepository) {
		self.repo = repo
	}
	
	func execute(update forUpdate: Payment, notificationIsOn: Bool) throws {
		try repo.updateNotification(payment: forUpdate, notificationIsOn: notificationIsOn)
	}
	
	func execute(close forClose: Payment) throws {
		try repo.closePayment(payment: forClose)
	}
	
	func execute(delete forDelete: Payment) throws {
		try repo.deleteLastPayment(payment: forDelete)
	}
	
	
}

