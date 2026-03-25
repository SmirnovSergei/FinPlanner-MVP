//
//  FieldView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 21.03.2026.
//
import SwiftUI

struct FieldView: View {
	var placeholder: String
	@Binding var text: String
	var isTextField: Bool = true
	var isPriceField: Bool = false
		
	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			Text(placeholder)
				.cygre(.light)
				.foregroundStyle(.white)
			if isTextField {
				TextField("", text: $text)
					.frame(height: 48)
					.padding(.horizontal, 10)
					.background(.appGray)
					.clipShape(Capsule())
					.keyboardType(isPriceField ? .decimalPad : .default)
					.overlay {
						Capsule()
							.stroke(.appGray, lineWidth: 1)
					}
			} else {
				TextEditor(text: $text)
					.frame(height: 154)
					.padding(.horizontal, 10)
					.background(.appGray)
					.clipShape(RoundedRectangle(cornerRadius: 20))
					.overlay {
						RoundedRectangle(cornerRadius: 20)
							.stroke(.appGray, lineWidth: 1)
					}
			}
		}
	}
}
