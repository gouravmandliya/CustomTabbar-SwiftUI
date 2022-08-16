//
//  ModelView.swift
//  CustomTabbar-Swiftui
//
//  Created by GOURAVM on 16/08/22.
//

import Foundation



class ModelView : ObservableObject {
    
    var tabs = ["Home","Restaurants","Orders","Rewards"]
    
    @Published var isOrderLoad = false
    @Published var isRestaurantsLoad = false
    @Published var isRewardLoad = false
    
    init() {
        print("Home Data Loaded")
    }
    
    func loadOrders() {
        print("order loaded")
        isOrderLoad = true
    }
    
    func loadRestaurants() {
        print("rastaurant loaded")
        isRestaurantsLoad = true
    }
    
    func loadRewards() {
        print("reward loaded")
        isRewardLoad = true
    }
}
