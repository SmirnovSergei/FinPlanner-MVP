//
//  FetchPaymentsRepository.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import Foundation

protocol FetchPaymentsRepository: AnyObject {
	func fetchPayments(from date: Date?, completion: (Result<[Payment], Error>) -> Void) throws
}
