//
//  DeletePaymentRepository.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 31.03.2026.
//

import Foundation

protocol DeletePaymentRepository: AnyObject {
	func deletePayment(payment: Payment) throws
}
