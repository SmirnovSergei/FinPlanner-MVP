//
//  Assembly.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import Foundation

class Assembly {
	static func createMainViewVodel() {
		
	}
	
	static func createAddViewModel() -> AddViewModel {
		let manager = CreatePaymentManager()
		let repo = CreatePaymentRepositoryImp(dataSource: manager)
		let useCase = CreateUseCaseImp(repository: repo)
		return AddViewModel(createUseCase: useCase)
	}
}
