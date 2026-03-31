//
//  PaymentsViewModel.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 25.03.2026.
//

import Foundation
import Combine

@MainActor
class PaymentsViewModel: ObservableObject {
	@Published var payments: [Payment] = []
	@Published var totalAmount: Decimal = .zero
	@Published var date: Date = .now {
		didSet {
			fetchPayments()
		}
	}
	
	private let fetchUseCase: FetchPaymentsUseCase
	init(fetchUseCase: FetchPaymentsUseCase) {
		self.fetchUseCase = fetchUseCase
	}
	
	func fetchPayments() {
		do {
			try fetchUseCase.execute(from: date) { [weak self] result in
				guard let self = self else { return }
				switch result {
				case .success(let succsess):
					self.payments = succsess
					self.totalAmount = succsess.reduce(0, {
						$0 + $1.paymentAmount
					})
				case .failure(let failure):
					print(failure.localizedDescription)
				}
			}
		} catch {
			print(error.localizedDescription)
		}
	}
}
