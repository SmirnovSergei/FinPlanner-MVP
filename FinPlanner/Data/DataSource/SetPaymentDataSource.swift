//
//  SetPaymentDataSource.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 26.03.2026.
//

import Foundation

protocol SetPaymentDataSource: AnyObject {
	func setPayment(payment: Payment) throws
}
