//
//  SolidButton.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//
import SwiftUI

struct SolidButton: View {
	var text: String
	var textColor: Color
	var bgColor: Color = .appBlack
	var solidColor: Color
	var isFull: Bool = false
	var action: (() -> ())?
	
	var body: some View {
		Button {
			action?()
		} label: {
			Text(text)
				.cygre(.regular, 12)
				.foregroundStyle(isFull ? .appBlack : textColor)
				.padding(.top, 12)
				.padding(.bottom, 16)
				.frame(maxWidth: .infinity)
				.background(isFull ? solidColor : bgColor)
				.clipShape(Capsule())
				.overlay {
					Capsule()
						.stroke(solidColor, lineWidth: 1)
				}
		}
	}
}
