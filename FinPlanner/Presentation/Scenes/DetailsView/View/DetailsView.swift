//
//  DetailsView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//

import SwiftUI

struct DetailsView: View {
	@Binding var path: NavigationPath
	@StateObject var viewModel: DetailsViewModel
	
	init(path: Binding<NavigationPath>, viewModel: DetailsViewModel) {
		self._path = path
		self._viewModel = StateObject(wrappedValue: viewModel)
	}
	
	var body: some View {
		VStack(alignment: .leading) {
			header
			
			VStack(alignment: .leading) {
				VStack(alignment: .leading, spacing: -8) {
					Text("\(viewModel.payment.totalAmount.formattedWithoutDecimals) ₽")
						.cygre(.black, 27)
						.foregroundStyle(.white)
					Text("\(viewModel.payment.title)")
						.cygre(.black, 16)
						.foregroundStyle(.appYellow)
				}
				.padding(.vertical, 20)
				
				VStack(alignment: .leading, spacing: 26) {
					VStack(alignment: .leading, spacing: 17) {
						HStack(spacing: 16) {
							if viewModel.payment.type == .monthly {
								InfoTagView(text: "\(viewModel.payment.remainingAmount.formattedWithoutDecimals) ₽")
								InfoTagView(text: "\(viewModel.payment.paymentAmount.formattedWithoutDecimals) ₽")
							}
						}
						
						Text("\(viewModel.payment.description)")
							.cygre(.regular)
							.foregroundStyle(.appMint)
					}
					
					VStack(alignment: .leading, spacing: 20) {
						Divider()
							.background(.appGray)
						
						PaymentStatus(paymentType: viewModel.payment.type, lastPay: viewModel.payment.lastPay, dueDate: viewModel.payment.dueDate)
							.padding(.horizontal, 10)
						
						Divider()
							.background(.appGray)
						
						HStack {
							Text("Уведомление о платеже")
								.cygre(.regular)
								.foregroundStyle(.appYellow)
								.offset(y: -3)
							
							Spacer()
							RadioButtonView(isSelected: $viewModel.isNotificationSelected)
								.alert("Уведомления отключены", isPresented: $viewModel.isShowedNotificationAlert) {
									Button("Открыть настройки") {
										guard let url = URL(string: UIApplication.openSettingsURLString) else {
											return
										}
										
										if UIApplication.shared.canOpenURL(url) {
											UIApplication.shared.open(url)
										}
									}
									
									Button("Отмена", role: .cancel) { }
								} message: {
									Text("Чтобы получать уведомления, включите их в настройках приложения")
								}
						}
						.padding(.horizontal, 10)
					}
				}
			}
			Spacer()
			
			VStack(spacing: 18) {
				SolidButton(text: "Закрыть досрочно", textColor: .appBlack, solidColor: .appYellow, isFull: true) {
					viewModel.close()
				}
				SolidButton(text: "Удалить последний платеж", textColor: .appYellow, solidColor: .appYellow) {
					viewModel.deleteLastPayment()
				}
			}
		}
		.padding(.horizontal, 20)
		.background(.appBlack)
		.navigationBarHidden(true)
	}
}

extension DetailsView {
	var header: some View {
		HStack {
			Button {
				path.removeLast()
			} label: {
				Image(systemName: "chevron.left")
					.resizable()
					.scaledToFit()
					.frame(width: 20, height: 20)
			}
			Spacer()
			
			Text("Детали платежа")
				.cygre(.black, 18)
			Spacer()
			
			Button {
				viewModel.delete()
				path.removeLast()
			} label: {
				Image(systemName: "trash")
					.resizable()
					.scaledToFit()
					.frame(width: 20, height: 20)
			}
		}
		.foregroundStyle(.appYellow)
	}
}
