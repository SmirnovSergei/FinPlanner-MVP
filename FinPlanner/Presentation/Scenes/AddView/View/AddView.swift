//
//  AddView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 21.03.2026.
//

import SwiftUI

struct AddView: View {
	@StateObject var viewModel: AddViewModel = Assembly.createAddViewModel()
	
	var body: some View {
		VStack(alignment: .center, spacing: 27) {
			Text("Добавить платеж")
				.cygre(.black, 18)
				.foregroundStyle(.appYellow)
			
			if !viewModel.isAdded {
				ZStack {
					Color.appBlack
						.ignoresSafeArea()
					addViewContent
				}
				.onTapGesture {
					UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
													to: nil,
													from: nil,
													for: nil
					)
				}
			} else {
				Spacer()
				addSuccsess
				Spacer()
			}
		}
		.padding(.horizontal, 10)
		.padding(.vertical, 20)
		.frame(maxWidth: .infinity)
		.background(.appBlack)
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
}

#Preview {
	AddView()
}

extension AddView {
	var addViewContent: some View {
		VStack(alignment: .center, spacing: 27) {
			VStack(alignment: .leading, spacing: 25) {
				HStack(spacing: 23) {
					SolidButton(text: "Каждый месяц", textColor: .appYellow, solidColor: .appYellow, isFull: viewModel.payType == .monthly) {
						viewModel.payType = .monthly
					}
					SolidButton(text: "Разово", textColor: .appYellow, solidColor: .appYellow, isFull: viewModel.payType == .oneTime) {
						viewModel.payType = .oneTime
					}
				}
				
				switch viewModel.payType {
				case .monthly:
					HStack(spacing: 4) {
						DatePicker("", selection: $viewModel.date,
								   displayedComponents: [.date]
						)
						.frame(width: 25)
						.clipped()
						.overlay {
							Text("\(viewModel.date.day)")
								.underline()
								.cygre(.black, 16)
								.foregroundStyle(.appMint)
								.frame(width: 27)
								.padding(.vertical, 4)
								.background(.appBlack)
								.allowsHitTesting(false)
						}
						Text("числа")
							.cygre(.light)
							.foregroundStyle(.appMint)
					}
				case .oneTime:
					HStack(spacing: 4) {
						Text("До")
							.cygre(.light)
							.foregroundStyle(.appMint)
						
						DatePicker("", selection: $viewModel.date,
								   displayedComponents: [.date]
						)
						.frame(width: 150)
						.clipped()
						.overlay {
							Text(viewModel.date.dayMonthYear)
								.underline()
								.cygre(.black, 16)
								.foregroundStyle(.appMint)
								.frame(width: 152)
								.padding(.vertical, 4)
								.background(.appBlack)
								.allowsHitTesting(false)
						}
					}
				}
			}
			
			VStack(alignment: .leading, spacing: 12) {
				FieldView(placeholder: "Название платежа", text: $viewModel.paymentName)
				
				switch viewModel.payType {
				case .monthly:
					HStack(spacing: 10) {
						FieldView(placeholder: "Общая сумма", text: $viewModel.totalAmount, isPriceField: true)
						FieldView(placeholder: "Ежемесячный платеж", text: $viewModel.paymentAmount, isPriceField: true)
					}
				case .oneTime:
					FieldView(placeholder: "Общая сумма", text: $viewModel.totalAmount, isPriceField: true)
				}
				
				FieldView(placeholder: "Описание", text: $viewModel.description, isTextField: false)
			}
			
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

			Spacer()
			FullButton(text: "Добавить", textColor: .appBlack, fillColor: .appYellow) {
				viewModel.createNewPayment()
			}
			.opacity(viewModel.isFormValid ? 1 : 0.5)
			.disabled(!viewModel.isFormValid)
		}
	}
}

extension AddView {
	var addSuccsess: some View {
		VStack(spacing: 55) {
			Image(systemName: "checkmark.circle")
				.resizable()
				.scaledToFit()
				.frame(width: 127, height: 127)
				.foregroundStyle(.appYellow)
			Text("Платеж добавлен")
				.cygre(.black, 22)
				.foregroundStyle(.appYellow)
		}
	}
}
