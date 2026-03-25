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
	
	var month: Int {
		Calendar.current.component(.month, from: self)
	}
}

extension Date {
	var startOfMonth: Date {
		let calendar = Calendar.current
		return calendar.date(
			from: calendar.dateComponents([.year, .month], from: self)
		)!
	}
	
	var endOfMonth: Date {
		let calendar = Calendar.current
		return calendar.date(
			byAdding: .month,
			value: 1,
			to: startOfMonth
		)!
	}

	var dateMonthString: String {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd.MM"
		return formatter.string(from: self)
	}
	
	func isInSameMonth(date: Date) -> Bool {
		let calendar = Calendar.current
		return calendar.component(.month, from: self) == calendar.component(.month, from: date) &&
			   calendar.component(.year, from: self) == calendar.component(.year, from: date)
	}
}
