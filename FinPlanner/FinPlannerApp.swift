//
//  FinPlannerApp.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 19.03.2026.
//

import SwiftUI

@main
struct FinPlannerApp: App {
	@State var path: NavigationPath = .init()
	
	var body: some Scene {
		WindowGroup {
			NavigationStack(path: $path) {
				MainTabView(path: $path)
					.navigationBarHidden(true)
					.navigationDestination(for: NavigationPage.self) { page in
						switch page {
						case .details(let payment):
							DetailsView(payment: payment, path: $path)
						}
					}
			}
			.onAppear {
				print(FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first as Any)
			}
		}
	}
}
