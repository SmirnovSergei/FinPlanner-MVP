//
//  MainViewModel.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import SwiftUI
import Combine

//@MainActor
class MainViewModel: ObservableObject {
	@Published var payments: [Payment] = []
	@Published var totalRemainderAmount: Decimal = .zero
	@Published var oneMonthRemainderAmount: Decimal = .zero
	@Published var oneTimeRemainderAmount: Decimal = .zero
	
	private let fetchUseCase: FetchPaymentsUseCase
	private let setUseCase: SetPaymentUseCase
	
	init(fetchUseCase: FetchPaymentsUseCase, setUseCase: SetPaymentUseCase) {
		self.fetchUseCase = fetchUseCase
		self.setUseCase = setUseCase
	}
	
	func fetchPayments() {
		do {
			try fetchUseCase.execute(from: nil) { [weak self] result in
				guard let self = self else { return }
				switch result {
				case .success(let succsess):
						self.payments = succsess
					self.totalRemainderAmount = succsess.reduce(0) {
						$0 + $1.remainingAmount
					}
					self.oneMonthRemainderAmount = succsess.reduce(0) {
						$0 + $1.paymentAmount
					}
					self.oneTimeRemainderAmount = succsess.filter {
						$0.type == .oneTime
					}.reduce(0) {
						$0 + $1.totalAmount
					}
				case .failure(let failure):
					print(failure.localizedDescription)
				}
			}
		} catch {
			print(error.localizedDescription)
		}
	}
	
	func setPayment(payment: Payment) {
		do {
			try setUseCase.execute(payment: payment)
		} catch {
			print(error.localizedDescription)
		}
	}
}
