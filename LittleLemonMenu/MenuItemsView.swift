//
//  MenuItemsView.swift
//  LittleLemonMenu
//
//  Created by  Rustem Orazbayev on 11.02.2023.
//

import SwiftUI

struct MenuItemsView: View {
    
    @ObservedObject var menu = MenuViewModel()
    
    @State var showOptionsView = false
        
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                let columns = [GridItem(), GridItem(), GridItem()]
                ForEach(FoodCategories.allCases, id:\.self) { category in
                    VStack {
                        HStack {
                            Text(category.rawValue)
                                .font(.system(.title, weight: .bold))
                            Spacer()
                        }
                        .padding(.horizontal)
                        LazyVGrid(columns: columns) {
                            ForEach(menu.items, id: \.id) { item in
                                let food: MenuItem = item as! MenuItem
                                NavigationLink {
                                    MenuItemDetailsView(
                                        foodName: food.title,
                                        foodPrice: food.price,
                                        foodOrderedCount: food.ordersCount,
                                        foodInggridients: food.ingridients
                                    )
                                } label: {
                                    if food.type == category {
                                        VStack {
                                            Rectangle()
                                                .frame(width: 100, height: 80)
                                                .background(.green)
                                            Text(food.title)
                                                .font(.system(.title3))
                                        }
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            showOptionsView = true
                        }
                }
            }
        }
        .sheet(isPresented: $showOptionsView) {
            MenuItemsOptionView(showOptionsView: $showOptionsView)
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
