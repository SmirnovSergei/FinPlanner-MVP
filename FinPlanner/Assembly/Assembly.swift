//
//  Assembly.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import Foundation

class Assembly {
	static func createMainViewVodel() -> MainViewModel {
		let dataSource = FetchPaymentManager()
		let repo = FetchPaymentRepositoryImp(dataSource: dataSource)
		let useCase = FetchPaymentsUseCaseImp(repository: repo)
		return MainViewModel(fetchUseCase: useCase)
	}
	
	static func createAddViewModel() -> AddViewModel {
		let manager = CreatePaymentManager()
		let repo = CreatePaymentRepositoryImp(dataSource: manager)
		let useCase = CreateUseCaseImp(repository: repo)
		return AddViewModel(createUseCase: useCase)
	}
	
	static func createPaymentsViewModel() -> PaymentsViewModel {
		let dataSource = FetchPaymentManager()
		let repo = FetchPaymentRepositoryImp(dataSource: dataSource)
		let useCase = FetchPaymentsUseCaseImp(repository: repo)
		return PaymentsViewModel(fetchUseCase: useCase)
	}
}
