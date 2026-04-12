//
//  NotificationUseCase.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 01.04.2026.
//

import Foundation

protocol NotificationUseCase: AnyObject {
	func exeute(create item: NotificationItem, completion: @escaping (Bool) -> Void)
	func execute(delete id: String)
}

class NotificationUseCaseImp: NotificationUseCase {
	private let repository: NotificationRepository
	
	init(repository: NotificationRepository) {
		self.repository = repository
	}
	
	func exeute(create item: NotificationItem, completion: @escaping (Bool) -> Void) {
		repository.createNotification(item: item, completion: completion)
	}
	
	func execute(delete id: String) {
		repository.deleteNotification(from: id)
	}
	
	
}
