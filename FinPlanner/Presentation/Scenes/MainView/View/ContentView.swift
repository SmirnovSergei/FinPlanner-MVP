//
//  ContentView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 19.03.2026.
//

import SwiftUI

struct ContentView: View {
	@State var isShowAddView: Bool = false
	@State var payType: PayType = .monthly
	@StateObject var viewModel = Assembly.createMainViewVodel()
	@Binding var path: NavigationPath
	
	var body: some View {
		ZStack(alignment: .top) {
			HeaderView(date: .constant(.now), page: HeaderViewContent(totalDebt: "723 434 ₽", title: "Сумма долга", date: "15 декабря", pageType: .main), action: {
				isShowAddView.toggle()
			})
				.zIndex(1)
			
			ScrollView(showsIndicators: false) {
				VStack(alignment: .leading, spacing: 19) {
					MainViewContentHeader(payType: $payType)
					
					VStack(alignment: .leading, spacing: 25) {
						switch payType {
						case .monthly:
							ForEach(viewModel.payments.filter({ $0.type == .monthly })) { item in
								PaymentCard(path: $path, payment: item)
							}
						case .oneTime:
							ForEach(viewModel.payments.filter({ $0.type == .oneTime })) { item in
								PaymentCard(path: $path, payment: item)
							}
						}
					}
				}
				.padding(.top, 130)
				.padding(.bottom, 70)
			}
		}
		.padding(.horizontal, 20)
		.background(.appBlack)
		.sheet(isPresented: $isShowAddView) {
			AddView()
		}
		.onAppear {
			viewModel.fetchPayments()
		}
	}
}
