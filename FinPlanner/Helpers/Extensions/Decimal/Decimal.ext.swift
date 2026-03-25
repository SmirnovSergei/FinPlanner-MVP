//
//  Decimal.ext.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 25.03.2026.
//

import Foundation

extension Decimal {
	var formattedWithoutDecimals: String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.groupingSeparator = " "
		formatter.maximumFractionDigits = 0
		
		return formatter.string(from: self as NSNumber) ?? ""
	}
}
