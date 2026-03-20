//
//  SolidButton.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//
import SwiftUI

struct SolidButton: View {
	var body: some View {
		Button {
			//
		} label: {
			Text("Подробнее")
				.cygre(.light, 12)
				.foregroundStyle(.appBlack)
				.padding(.top, 12)
				.padding(.bottom, 16)
				.frame(maxWidth: .infinity)
				.overlay {
					Capsule()
						.stroke(.appBlack, lineWidth: 1)
				}
		}
	}
}
