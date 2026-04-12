//
//  NotificationDataSource.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 01.04.2026.
//

import Foundation

protocol NotificationDataSource: AnyObject {
	func createNotification(item: NotificationItem, completion: @escaping (Bool) -> Void)
	func deleteNotification(from id: String)
}
