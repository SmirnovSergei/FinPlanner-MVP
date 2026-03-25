//
//  PaymentsViewModel.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 25.03.2026.
//

import Foundation
import Combine

class PaymentsViewModel: ObservableObject {
	@Published var payments: [Payment] = []
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
					DispatchQueue.main.async {
						self.payments = succsess
					}
				case .failure(let failure):
					print(failure.localizedDescription)
				}
			}
		} catch {
			print(error.localizedDescription)
		}
	}
}
