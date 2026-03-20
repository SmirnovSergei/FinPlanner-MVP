//
//  MainViewContentHeader.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//

import SwiftUI

struct MainViewContentHeader: View {
	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Text("Долги")
					.cygre(.black, 16)
					.foregroundStyle(.appYellow)
				Spacer()
				HStack(spacing: 16) {
					Button {
						//
					} label: {
						Text("ежемесячно")
							.cygre(.black, 12)
							.foregroundStyle(.white)
					}

					Button {
						//
					} label: {
						Text("разово")
							.cygre(.light, 12)
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
