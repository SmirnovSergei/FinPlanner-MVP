//
//  FetchPaymentsUseCase.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import Foundation

protocol FetchPaymentsUseCase: AnyObject {
	func execute(from date: Date?, completion: (Result<[Payment], Error>) -> Void) throws
}

class FetchPaymentsUseCaseImp: FetchPaymentsUseCase {
	private let repository: FetchPaymentsRepository
	init(repository: FetchPaymentsRepository) {
		self.repository = repository
	}
	
	func execute(from date: Date?, completion: (Result<[Payment], any Error>) -> Void) throws {
		try repository.fetchPayments(from: date, completion: completion)
	}
}
