//
//  PaymentsView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//

import SwiftUI

struct PaymentsView: View {
	var body: some View {
		ZStack(alignment: .top) {
			HeaderView(page: HeaderViewContent(totalDebt: "25 500 ₽", title: "Платежей", date: "Декабррь 2025", pageType: .paymentList), action: {
				print("show calendar")
			})
			.zIndex(1)
			
			ScrollView(showsIndicators: false) {
				VStack(alignment: .leading, spacing: 19) {
					PaymentCard()
					PaymentCard()
				}
				.padding(.top, 130)
				.padding(.bottom, 70)
			}
		}
		.padding(.horizontal, 20)
		.background(.appBlack)
	}
}
