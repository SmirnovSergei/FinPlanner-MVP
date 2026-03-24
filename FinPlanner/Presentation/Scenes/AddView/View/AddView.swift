//
//  AddView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 21.03.2026.
//

import SwiftUI

struct AddView: View {
	@State var nameText: String = ""
	@State var isNotificationSelected = false
	@State var payType: PayType = .monthly
	@State var date: Date = .now
	@State var isShowCalendar = false
	@State var isAdded: Bool = false
	@State var viewModel: AddViewModel = Assembly.createAddViewModel()
	
	var body: some View {
		VStack(alignment: .center, spacing: 27) {
			Text("Добавить платеж")
				.cygre(.black, 18)
				.foregroundStyle(.appYellow)
			
			if !isAdded {
				addViewContent
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
					SolidButton(text: "Каждый месяц", textColor: .appYellow, solidColor: .appYellow, isFull: payType == .monthly) {
						payType = .monthly
					}
					SolidButton(text: "Разово", textColor: .appYellow, solidColor: .appYellow, isFull: payType == .oneTime) {
						payType = .oneTime
					}
				}
				
				switch payType {
				case .monthly:
					HStack(spacing: 4) {
						DatePicker("", selection: $date,
								   displayedComponents: [.date]
						)
						.frame(width: 25)
						.clipped()
						.overlay {
							Text("\(date.day)")
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
						
						DatePicker("", selection: $date,
								   displayedComponents: [.date]
						)
						.frame(width: 150)
						.clipped()
						.overlay {
							Text(date.dayMonthYear)
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
				FieldView(placeholder: "Название платежа", text: $nameText, isTextField: true)
				
				switch payType {
				case .monthly:
					HStack(spacing: 10) {
						FieldView(placeholder: "Общая сумма", text: $nameText, isTextField: true)
						FieldView(placeholder: "Ежемесячный платеж", text: $nameText, isTextField: true)
					}
				case .oneTime:
					FieldView(placeholder: "Общая сумма", text: $nameText, isTextField: true)
				}
				
				FieldView(placeholder: "Описание", text: $nameText, isTextField: false)
			}
			
			HStack {
				Text("Уведомление о платеже")
					.cygre(.regular)
					.foregroundStyle(.appYellow)
					.offset(y: -3)
				
				Spacer()
				RadioButtonView(isSelected: $isNotificationSelected)
			}
			.padding(.horizontal, 10)

			Spacer()
			FullButton(text: "Добавить", textColor: .appBlack, fillColor: .appYellow) {
				viewModel.createNewPayment()
			}
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
