//
//  PaymentsView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//

import SwiftUI

struct PaymentsView: View {
	@Binding var path: NavigationPath
	@StateObject var viewModel = Assembly.createPaymentsViewModel()
	
	var body: some View {
		ZStack(alignment: .top) {
			HeaderView(date: $viewModel.date, page: HeaderViewContent(totalDebt: "25 500 ₽", title: "Платежей", date: viewModel.date.monthYear, pageType: .paymentList))
			.zIndex(1)
			
			ScrollView(showsIndicators: false) {
				VStack(alignment: .leading, spacing: 19) {
					ForEach(viewModel.payments) { payment in
					PaymentCard(path: $path, payment: payment)
					}
				}
				.padding(.top, 130)
				.padding(.bottom, 70)
			}
		}
		.padding(.horizontal, 20)
		.background(.appBlack)
		.onAppear {
			viewModel.fetchPayments()
		}
	}
}
