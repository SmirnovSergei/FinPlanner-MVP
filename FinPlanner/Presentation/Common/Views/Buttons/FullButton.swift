//
//  FullButton.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//
import SwiftUI

struct FullButton: View {
	var text: String
	var textColor: Color
	var fillColor: Color
	var action: (() -> Void)?
	
	var body: some View {
		Button {
			action?()
		} label: {
			Text(text)
				.cygre(.regular, 12)
				.foregroundStyle(textColor)
				.padding(.top, 12)
				.padding(.bottom, 16)
				.frame(maxWidth: .infinity)
				.background(fillColor)
				.clipShape(Capsule())
		}
	}
}
