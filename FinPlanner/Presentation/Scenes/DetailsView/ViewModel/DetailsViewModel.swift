//
//  DetailsViewModel.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 28.03.2026.
//

import Foundation
import Combine

class DetailsViewModel: ObservableObject {
	@Published var isNotificationSelected: Bool = false {
		willSet {
			self.updateNotiication(newValue)
		}
	}
	
	var payment: Payment
	init(payment: Payment) {
		self.payment = payment
	}
	
	func delete() {
		print(#function)
	}
	
	func updateNotiication(_ newValue: Bool) {
		print(#function)
	}
	
	func close() {
		print(#function)
	}
	
	func deleteLastPayment() {
		print(#function)
	}
}
