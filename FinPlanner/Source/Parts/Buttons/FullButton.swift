//
//  FullButton.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//
import SwiftUI

struct FullButton: View {
	var body: some View {
		Button {
			//
		} label: {
			Text("Оплатить")
				.cygre(.light, 12)
				.foregroundStyle(.white)
				.padding(.top, 12)
				.padding(.bottom, 16)
				.frame(maxWidth: .infinity)
				.background(.appBlack)
				.clipShape(Capsule())
		}
	}
}
