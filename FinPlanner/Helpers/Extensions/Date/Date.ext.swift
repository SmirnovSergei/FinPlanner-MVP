//
//  Date.ext.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 22.03.2026.
//
import Foundation

extension Date {
	static let dayMonthFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.locale = Locale.current
		formatter.dateFormat = "d MMMM YYYY"
		return formatter
	}()
	
	static let withoutDayMonthFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.locale = Locale.current
		formatter.dateFormat = "MMMM YYYY"
		return formatter
	}()
	
	var dayMonthYear: String {
		Self.dayMonthFormatter.string(from: self)
	}
	
	var monthYear: String {
		Self.withoutDayMonthFormatter.string(from: self)
	}
	
	var day: Int {
		Calendar.current.component(.day, from: self)
	}
}
