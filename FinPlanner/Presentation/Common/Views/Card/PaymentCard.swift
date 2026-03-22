//
//  PaymentCard.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//
import SwiftUI

struct PaymentCard: View {
	@Binding var path: NavigationPath
	
	var body: some View {
		VStack(alignment: .leading, spacing: 12) {
			VStack(alignment: .leading, spacing: 5) {
				VStack(alignment: .leading, spacing: 10) {
					VStack(alignment: .leading, spacing: 0) {
						Text("Долг по кредитке")
							.cygre(.black, 24)
						
						HStack(spacing: 5) {
							Text("₽ 32 500")
								.cygre(.black, 12)
							Text("/ Остаток")
								.cygre(.regular, 12)
						}
					}
					Text("This course will be your personal guide to be in UI")
						.cygre(.regular, 14)
					
					HStack(spacing: 5) {
						HStack {
							Text("₽ 1 200")
								.cygre(.black, 18)
							Text("/ Месяц")
								.cygre(.regular, 18)
						}
						Spacer()
							HStack(spacing: 5) {
								Text("оплатить до")
									.cygre(.light, 12)
								Text("21.12")
									.cygre(.black, 12)
							}
							.padding(.horizontal, 11)
							.padding(.bottom, 4)
							.background(.appBlack)
							.foregroundStyle(.white)
							.clipShape(Capsule())
					}
				}
			}
			
			HStack {
				FullButton(text: "Оплатить", textColor: .white, fillColor: .appBlack)
				SolidButton(text: "Подробнее", textColor: .appBlack, bgColor: .clear, solidColor: .appBlack, isFull: false) {
					path.append(NavigationPage.details)
				}
			}
		}
		.padding(.horizontal, 12)
		.padding(.top, 10)
		.padding(.bottom, 20)
		.background(.appRed)
		.clipShape(RoundedRectangle(cornerRadius: 25))
	}
}
