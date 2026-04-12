//
//  FetchPaymentDataSource.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 25.03.2026.
//

import Foundation

protocol FetchPaymentDataSource: AnyObject {
	func fetchPayments(date: Date?, completion: (Result<[Payment], Error>) -> Void) throws
}
