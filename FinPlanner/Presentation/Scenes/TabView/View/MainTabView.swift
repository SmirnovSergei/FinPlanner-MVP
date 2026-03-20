//
//  MainTabView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 19.03.2026.
//
import SwiftUI

struct MainTabView: View {
	@State var selectionPage: TabPage = .paymentList
	
	init() {
		UITabBar.appearance().isHidden = true
	}
	
	var body: some View {
		ZStack(alignment: .bottom) {
			TabView(selection: $selectionPage) {
				ContentView()
					.tag(TabPage.main)
				PaymentsView()
					.tag(TabPage.paymentList)
			}
			
			HStack(spacing: 62) {
				//								ForEach(TabPage.allCases, id: \.self) { page in
				//									Text("1")
				//								}
				
				TabItem(selected: $selectionPage, image: "house", text: "главная", pageType: .main)
				TabItem(selected: $selectionPage, image: "list.bullet.rectangle.portrait", text: "платежи", pageType: .paymentList)
			}
			.frame(maxWidth: .infinity)
			.padding(.top, 20)
			.background(.appBlack)
		}
	}
}

#Preview {
	MainTabView()
}
struct TabItem: View {
	@Binding var selected: TabPage
	var image: String
	var text: String
	var pageType: TabPage
	
	var body: some View {
		Button {
			selected = pageType
		} label: {
			VStack {
				Image(systemName: image)
					.resizable()
					.scaledToFit()
					.frame(width: 16, height: 16)
				Text(text)
					.cygre(.light, 10)
			}
			.foregroundStyle(pageType == selected ? .appBlack : .appYellow)
			.padding(.vertical, 6)
			.padding(.horizontal, 17)
			.background(pageType == selected ? .appYellow : .clear)
			.clipShape(RoundedRectangle(cornerRadius: 35))
		}
	}
}
