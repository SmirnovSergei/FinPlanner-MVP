//
//  AddViewModel.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import SwiftUI
import Combine

class AddViewModel: ObservableObject {
	private let createUseCase: CreatePaymentUseCase
	init(createUseCase: CreatePaymentUseCase) {
		self.createUseCase = createUseCase
	}
	
	@Published var payment: Payment?
	
	func createNewPayment() {
		do {
			try createUseCase.execute(payment: Payment(id: UUID().uuidString,
													   type: .monthly,
													   title: "Title",
													   description: "Description",
													   paymentAmount: 10,
													   totalAmount: 20,
													   isNotificationEnable: true,
													   createdAt: .now))
		} catch {
			print(error.localizedDescription)
		}
	}
}
