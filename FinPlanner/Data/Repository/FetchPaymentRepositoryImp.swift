//
//  FetchPaymentRepositoryImp.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 25.03.2026.
//

import Foundation

class FetchPaymentRepositoryImp: FetchPaymentsRepository {
	private let dataSource: FetchPaymentDataSource
	init(dataSource: FetchPaymentDataSource) {
		self.dataSource = dataSource
	}
	
	func fetchPayments(from date: Date?, completion: (Result<[Payment], any Error>) -> Void) throws {
		try dataSource.fetchPayments(date: date, completion: completion)
	}
}
