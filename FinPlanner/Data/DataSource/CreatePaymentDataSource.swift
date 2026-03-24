//
//  CreatePaymentDataSource.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import Foundation

protocol CreatePaymentDataSource {
	func createNewPayment(payment: Payment) throws
}
