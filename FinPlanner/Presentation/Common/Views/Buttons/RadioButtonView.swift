//
//  RadioButtonView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//
import SwiftUI

struct RadioButtonView: View {
	@Binding var isSelected: Bool
	
	var body: some View {
		ZStack {
			Circle()
				.stroke(.appYellow, lineWidth: 2)
				.frame(width: 26, height: 26)
			
			if isSelected {
				Circle()
					.fill(.appYellow)
					.frame(width: 12, height: 12)
			}
		}
		.onTapGesture {
			isSelected.toggle()
		}
	}
}
