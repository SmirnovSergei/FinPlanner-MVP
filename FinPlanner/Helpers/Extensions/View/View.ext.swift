//
//  View.ext.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 19.03.2026.
//

import SwiftUI

extension View {
	func cygre(_ font: Cygre = .regular, _ size: CGFloat = 14) -> some View {
		self.font(.custom(font.rawValue, size: size))
	}
}
