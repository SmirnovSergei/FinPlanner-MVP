//
//  HeaderView.swift
//  FinPlanner
//
//  Created by Сергей Смирнов on 20.03.2026.
//
import SwiftUI

struct HeaderView: View {
	var page: HeaderViewContent
	var action: () -> Void
	
	var body: some View {
		VStack(alignment: .leading, spacing: -7) {
			HStack {
				Text("\(page.totalDebt) ₽")
					.cygre(.black, 27)
					.foregroundStyle(.white)
					.offset(y: -2)
				Spacer()
				
				if page.pageType == .main {
					Button {
						action()
					} label: {
						ZStack {
							Circle()
								.fill(.appYellow)
								.frame(width: 25)
							Image(systemName: "plus")
								.resizable()
								.scaledToFit()
								.frame(width: 11)
								.foregroundStyle(.appBlack)
						}
					}
				}
			}
			VStack(alignment: .leading, spacing: -7) {
				HStack {
					Text("\(page.title)")
						.cygre(.black, 32)
					Spacer()
					
					if page.pageType == .paymentList {
						Button {
							action()
						} label: {
							Image(systemName: "calendar")
								.resizable()
								.scaledToFit()
								.frame(width: 23, height: 23)
								.padding(.top, 4)
						}
					}
				}
				
				Text("\(page.date)")
					.cygre(.light, 16)
			}
			.foregroundStyle(.appYellow)
		}
		.padding(.bottom, 20)
		.background(.appBlack)
	}
}
