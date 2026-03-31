//
//  Assembly.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 24.03.2026.
//

import Foundation

class Assembly {
	static func createMainViewModel() -> MainViewModel {
		let dataSource = FetchPaymentManager()
		let repo = FetchPaymentRepositoryImp(dataSource: dataSource)
		let useCase = FetchPaymentsUseCaseImp(repository: repo)
		
		let setDataSource = SetPaymentManager()
		let setRepo = SetPaymentRepositoryImp(dataSource: setDataSource)
		let setUseCase = SetPaymentUseCaseImp(repository: setRepo)
		
		return MainViewModel(fetchUseCase: useCase, setUseCase: setUseCase)
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
	
	static func createDetailsViewModel(payment: Payment) -> DetailsViewModel {
		let deleteDataSource = DeletePaymentManager()
		let deleteRepo = DeletePaymentRepositoryImp(dataSource: deleteDataSource)
		let deleteUseCase = DeletePaymentUseCaseImp(repo: deleteRepo)

		let updateDataSource = UpdatePaymentManager()
		let updateRepo = UpdatePaymentRepositoryImp(dataSource: updateDataSource)
		let updateUseCase = UpdatePaymentUseCaseImp(repo: updateRepo)
		
		return DetailsViewModel(deleteUseCase: deleteUseCase, updateUseCase: updateUseCase, payment: payment)
	}
}
