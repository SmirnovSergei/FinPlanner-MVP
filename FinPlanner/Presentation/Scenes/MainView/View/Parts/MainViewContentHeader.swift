//
//  MainViewContentHeader.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//

import SwiftUI

struct MainViewContentHeader: View {
	@Binding var payType: PayType
	
	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Text("Долги")
					.cygre(.black, 16)
					.foregroundStyle(.appYellow)
				Spacer()
				HStack(spacing: 16) {
					Button {
						payType = .monthly
					} label: {
						Text("ежемесячно")
							.cygre(payType == .monthly ? .black : .light, 12)
							.foregroundStyle(.white)
					}

					Button {
						payType = .oneTime
					} label: {
						Text("разово")
							.cygre(payType == .oneTime ? .black : .light, 12)
							.foregroundStyle(.white)
					}
				}
			}
			
			HStack {
				Text("₽ 25,500")
					.cygre(.black, 14)
					.foregroundStyle(.white)
				Text("/ Каждый месяц")
					.cygre(.regular, 14)
					.foregroundStyle(.white)
			}
		}
	}
}
