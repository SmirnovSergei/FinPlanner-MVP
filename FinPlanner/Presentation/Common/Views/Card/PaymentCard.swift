//
//  PaymentCard.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//
import SwiftUI

struct PaymentCard: View {
	@Binding var path: NavigationPath
	var payment: Payment
	var action: () -> Void
	
	var body: some View {
		VStack(alignment: .leading, spacing: 12) {
			VStack(alignment: .leading, spacing: 5) {
				VStack(alignment: .leading, spacing: 10) {
					VStack(alignment: .leading, spacing: 0) {
						Text(payment.title)
							.cygre(.black, 24)
						
						HStack(spacing: 5) {
							Text("\(payment.remainingAmount.formattedWithoutDecimals) ₽")
								.cygre(.black, 12)
							Text("/ Остаток")
								.cygre(.regular, 12)
						}
					}
					Text("This course will be your personal guide to be in UI")
						.cygre(.regular, 14)
					
					HStack(spacing: 5) {
						HStack {
							if payment.type == .monthly {
								Text("\(payment.paymentAmount.formattedWithoutDecimals) ₽")
									.cygre(.black, 18)
								Text("/ Месяц")
									.cygre(.regular, 18)
							} else {
								Text("\(payment.remainingAmount.formattedWithoutDecimals) ₽")
									.cygre(.black, 18)
							}
						}
						Spacer()
						PaymentStatus(paymentType: payment.type, lastPay: payment.lastPay, dueDate: payment.dueDate, isShowLabel: false)
					}
				}
			}
			
			HStack {
				if !(payment.lastPay?.isInSameMonth(date: Date.now) ?? false) {
					FullButton(text: "Оплатить", textColor: .white, fillColor: .appBlack) {
						action()
					}
				}
				
				SolidButton(text: "Подробнее", textColor: .appBlack, bgColor: .clear, solidColor: .appBlack, isFull: false) {
					path.append(NavigationPage.details(payment: payment))
				}
			}
		}
		.padding(.horizontal, 12)
		.padding(.top, 10)
		.padding(.bottom, 20)
		.background(payment.lastPay?.isInSameMonth(date: Date.now) ?? false ? .appMint : .appRed)
		.clipShape(RoundedRectangle(cornerRadius: 25))
	}
}
