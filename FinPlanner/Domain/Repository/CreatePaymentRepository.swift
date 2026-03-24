//
//  CreatePaymentRepository.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import Foundation

protocol CreatePaymentRepository: AnyObject {
	func createPayment(payment: Payment) throws
}

