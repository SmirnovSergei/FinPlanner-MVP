//
//  NotificationManager.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 01.04.2026.
//

import Foundation
import UserNotifications

class NotificationManager: NotificationDataSource {
	private func checkPermissions(completion: @escaping (Bool) -> Void) {
		UNUserNotificationCenter.current().getNotificationSettings { setting in
			switch setting.authorizationStatus {
			case .notDetermined:
				UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granded, _ in
					completion(true)
				} // Request пишется ОДИН раз!!!
			case .denied:
				completion(false)
			case .authorized, .provisional:
				completion(true)
			default:
				completion(false)
			}
		}
	}

	func createNotification(item: NotificationItem, completion: @escaping (Bool) -> Void) {
		self.checkPermissions { allowed in
			guard allowed else {
				print("Notifications Access Denied")
				DispatchQueue.main.async {
					completion(true)
				}
				return
			}
		}
		let content = UNMutableNotificationContent()
		switch item.type {
		case .monthly:
			content.title = "📅 Ежемесячный платеж"
			content.body = "Напоминаем о ежемесячном платеже \(item.amount), дата оплаты - \(item.date.dateMonthString)."
		case .oneTime:
			content.title = "💳 Пора оплатить долг"
			content.body = "Напоминаем об оплате долга до \(item.date.dateMonthString)."
		}
		
		content.sound = .default
		
		var component = DateComponents()
		component.day = max(item.date.clampedDay(item.date.day) - 2, 1)
		component.hour = 11
		component.minute = 1
		
		let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: item.type == .monthly)
		let request = UNNotificationRequest(identifier: item.id,
											content: content,
											trigger: trigger)
		
		UNUserNotificationCenter.current().add(request)
	}
	
	func deleteNotification(from id: String) {
		UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
	}
}
