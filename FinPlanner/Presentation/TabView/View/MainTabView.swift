//
//  MainTabView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 19.03.2026.
//

import SwiftUI

struct MainTabView: View {
	init() {
		UITabBar.appearance().isHidden = true
	}
	
	var body: some View {
		ZStack(alignment: .bottom) {
			TabView {
				ContentView()
			}
			HStack {
				//
			}
		}
	}
}

#Preview {
	MainTabView()
}
