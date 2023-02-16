//
//  MenuItemsOptionView.swift
//  LittleLemonMenu
//
//  Created by Rustem Orazbayev on 11.02.2023.
//

import SwiftUI

struct MenuItemsOptionView: View {
    
    @Binding var showOptionsView: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("SELECTED CATEGORIES") {
                        ForEach(FoodCategories.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    Section("Sort by") {
                        ForEach(FilterCases.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
            }
            .navigationTitle("Filter")
            .toolbar {
                ToolbarItem {
                    Button {
                        showOptionsView = false
                    } label: {
                        Text("Done")
                    }

                }
            }
        }
    }
}

struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionView(showOptionsView: .constant(true))
    }
}
