//
//  HeaderView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//
import SwiftUI

struct HeaderView: View {
	var body: some View {
		VStack(alignment: .leading, spacing: -7) {
			HStack {
				Text("723 434 ₽")
					.cygre(.black, 27)
					.foregroundStyle(.white)
					.offset(y: -2)
				Spacer()
				Button {
					//
				} label: {
					ZStack {
						Circle()
							.fill(.appYellow)
							.frame(width: 25)
						Image(systemName: "plus")
							.resizable()
							.scaledToFit()
							.frame(width: 11)
							.foregroundStyle(.appBlack)
					}
				}
			}
			VStack(alignment: .leading, spacing: -7) {
				Text("Сумма долга")
					.cygre(.black, 32)
				Text("15 декабря")
					.cygre(.light, 16)
			}
			.foregroundStyle(.appYellow)
		}
		.padding(.bottom, 20)
		.background(.appBlack)
	}
}
