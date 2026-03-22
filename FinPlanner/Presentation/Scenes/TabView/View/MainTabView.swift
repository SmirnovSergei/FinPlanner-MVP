//
//  MainTabView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 19.03.2026.
//
import SwiftUI

struct MainTabView: View {
	@State var selectionPage: TabPage = .main
	@Binding var path: NavigationPath
	
	init(path: Binding<NavigationPath>) {
		UITabBar.appearance().isHidden = true
		self._path = path
	}
	
	var body: some View {
		ZStack(alignment: .bottom) {
			TabView(selection: $selectionPage) {
				ContentView(path: $path)
					.tag(TabPage.main)
				PaymentsView(path: $path)
					.tag(TabPage.paymentList)
			}
			
			HStack(spacing: 62) {
				TabItem(selected: $selectionPage, image: "house", text: "главная", pageType: .main)
				TabItem(selected: $selectionPage, image: "list.bullet.rectangle.portrait", text: "платежи", pageType: .paymentList)
			}
			.frame(maxWidth: .infinity)
			.padding(.top, 20)
			.background(.appBlack)
		}
	}
}

//#Preview {
//	MainTabView()
//}
