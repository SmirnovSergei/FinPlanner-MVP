//
//  InfoTagView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//
import SwiftUI

struct InfoTagView: View {
	var text: String
	
	var body: some View {
		Text(text)
			.cygre(.black, 16)
			.foregroundStyle(.appYellow)
			.padding(.horizontal, 17)
			.padding(.bottom, 9)
			.padding(.top, 4)
			.overlay {
				Capsule()
					.stroke(.appYellow, lineWidth: 1)
			}
	}
}
