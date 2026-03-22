//
//  DetailsView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//

import SwiftUI

struct DetailsView: View {
	@State var isNotificationSelected = false
	@Binding var path: NavigationPath
	
	var body: some View {
		VStack(alignment: .leading) {
			header
			
			VStack(alignment: .leading) {
				VStack(alignment: .leading, spacing: -8) {
					Text("82 200 ₽")
						.cygre(.black, 27)
						.foregroundStyle(.white)
					Text("Кредит на iPhone")
						.cygre(.black, 16)
						.foregroundStyle(.appYellow)
				}
				.padding(.vertical, 20)
				
				VStack(alignment: .leading, spacing: 26) {
					VStack(alignment: .leading, spacing: 17) {
						HStack(spacing: 16) {
							InfoTagView(text: "60 200 ₽")
							InfoTagView(text: "3 200 ₽")
						}
						
						Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam")
							.cygre(.regular)
							.foregroundStyle(.appMint)
					}
					
					VStack(alignment: .leading, spacing: 20) {
						Divider()
							.background(.appGray)
						HStack {
							Text("Ближайший платеж")
								.cygre(.regular)
								.foregroundStyle(.appYellow)
								.offset(y: -3)
							
							Spacer()
							HStack(spacing: 4) {
								Text("оплачен")
									.cygre(.regular, 12)
								Text("13.12")
									.cygre(.black, 12)
							}
							.padding(.horizontal, 10)
							.padding(.bottom, 4)
							.background(.appYellow)
							.clipShape(Capsule())
						}
						.padding(.horizontal, 10)
						
						Divider()
							.background(.appGray)
						
						HStack {
							Text("Уведомление о платеже")
								.cygre(.regular)
								.foregroundStyle(.appYellow)
								.offset(y: -3)
							
							Spacer()
							RadioButtonView(isSelected: $isNotificationSelected)
						}
						.padding(.horizontal, 10)
					}
				}
			}
			Spacer()
			
			VStack(spacing: 18) {
				SolidButton(text: "Закрыть досрочно", textColor: .appBlack, solidColor: .appYellow, isFull: true)
				SolidButton(text: "Удалить последний платеж", textColor: .appYellow, solidColor: .appYellow)
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
				//
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
