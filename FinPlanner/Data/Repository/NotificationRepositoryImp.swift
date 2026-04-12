//
//  NotificationRepositoryImp.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 01.04.2026.
//

import Foundation

class NotificationRepositoryImp: NotificationRepository {
	private let dataSource: NotificationDataSource
	
	init(dataSource: NotificationDataSource) {
		self.dataSource = dataSource
	}
	
	func createNotification(item: NotificationItem, completion: @escaping (Bool) -> Void) {
		dataSource.createNotification(item: item, completion: completion)
	}
	
	func deleteNotification(from id: String) {
		dataSource.deleteNotification(from: id)
	}
}
