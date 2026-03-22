//
//  PaymentsView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//

import SwiftUI

struct PaymentsView: View {
	@State var date: Date = .now
	@Binding var path: NavigationPath
	
	var body: some View {
		ZStack(alignment: .top) {
			HeaderView(date: $date, page: HeaderViewContent(totalDebt: "25 500 ₽", title: "Платежей", date: date.monthYear, pageType: .paymentList))
			.zIndex(1)
			
			ScrollView(showsIndicators: false) {
				VStack(alignment: .leading, spacing: 19) {
					PaymentCard(path: $path)
					PaymentCard(path: $path)
				}
				.padding(.top, 130)
				.padding(.bottom, 70)
			}
		}
		.padding(.horizontal, 20)
		.background(.appBlack)
	}
}

//#Preview {
//	PaymentsView()
//}
