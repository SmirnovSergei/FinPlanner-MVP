//
//  PaymentStatus.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 28.03.2026.
//
import SwiftUI

struct PaymentStatus: View {
	var paymentType: PayType
	var lastPay: Date?
	var dueDate: Date?
	var isShowLabel: Bool = true
	
	var body: some View {
		HStack {
			switch paymentType {
			case .monthly:
				if isShowLabel {
					Text("Ближайший платеж")
						.cygre(.regular)
						.foregroundStyle(.appYellow)
						.offset(y: -3)
					
					Spacer()
				}
				
				if let lastPay, lastPay.isInSameMonth(date: .now) {
					HStack(spacing: 4) {
						Text("оплачен")
							.cygre(.regular, 12)
						Text(lastPay.dateMonthString)
							.cygre(.black, 12)
					}
					.padding(.horizontal, 10)
					.padding(.bottom, 4)
					.background(.appYellow)
					.clipShape(Capsule())
				} else {
					HStack(spacing: 4) {
						Text("оплатить до")
							.cygre(.regular, 12)
						Text("\(dueDate?.day ?? 0).\(Date().month)")
							.cygre(.black, 12)
					}
					.padding(.horizontal, 10)
					.padding(.bottom, 4)
					.background(.appYellow)
					.clipShape(Capsule())
				}

			case .oneTime:
				if isShowLabel {
					Text("Оплатить до")
						.cygre(.regular)
						.foregroundStyle(.appYellow)
						.offset(y: -3)
					
					Spacer()
				}
				
				HStack(spacing: 4) {
					Text(dueDate?.dateMonthString ?? "")
						.cygre(.black, 12)
				}
				.padding(.horizontal, 10)
				.padding(.bottom, 4)
				.background(.appYellow)
				.clipShape(Capsule())
			}
		}
	}
}
