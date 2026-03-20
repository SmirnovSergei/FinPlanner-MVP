//
//  ContentView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 19.03.2026.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		ZStack(alignment: .top) {
			HeaderView(page: HeaderViewContent(totalDebt: "723 434 ₽", title: "Сумма долга", date: "15 декабря", pageType: .main), action: {
				print("add")
			})
				.zIndex(1)
			
			ScrollView(showsIndicators: false) {
				VStack(alignment: .leading, spacing: 19) {
					MainViewContentHeader()
					
					VStack(alignment: .leading, spacing: 25) {
						PaymentCard()
						PaymentCard()
						PaymentCard()
						PaymentCard()
					}
				}
				.padding(.top, 130)
				.padding(.bottom, 70)
			}
		}
		.padding(.horizontal, 20)
		.background(.appBlack)
	}
}
