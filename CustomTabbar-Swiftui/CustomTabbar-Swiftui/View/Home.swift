//
//  Home.swift
//  CustomTabbar-Swiftui
//
//  Created by GOURAVM on 16/08/22.
//

import SwiftUI

struct Home: View {
    
    @State var selectedTab = "Home"
    @Namespace var animation
    @StateObject var modelData = ModelView()
    
    var edges  = UIApplication
        .shared
        .connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
        .first { $0.isKeyWindow }?.safeAreaInsets
    
    
    var body: some View {
        
        VStack(spacing:0){
            GeometryReader { _ in
                ZStack{
                    ScrollView{
                        ForEach(1...25,id: \.self){ i in
                            NavigationLink(destination: Text("Home Data \(i)")) {
                                VStack(alignment:.leading){
                                    Text("Home data \(i)")
                                        .padding()
                                        .foregroundColor(.black)
                                    Divider()
                                }
                            }
                            
                        }
                        .padding(.bottom)
                    }
                    .opacity(selectedTab  == "Home" ? 1 : 0)
                    ScrollView{
                        ForEach(1...25,id: \.self){ i in
                            NavigationLink(destination: Text("Restaurants Data \(i)")) {
                                VStack(alignment:.leading){
                                    Text("Restaurants data \(i)")
                                        .padding()
                                        .foregroundColor(.black)
                                    Divider()
                                }
                            }
                            
                        }
                        .padding(.bottom)
                    }
                    .opacity(selectedTab == "Restaurants" ? 1 : 0)
                    ScrollView{
                        ForEach(1...25,id: \.self){ i in
                            NavigationLink(destination: Text("Orders Data \(i)")) {
                                VStack(alignment:.leading){
                                    Text("Orders data \(i)")
                                        .padding()
                                        .foregroundColor(.black)
                                    Divider()
                                }
                            }
                            
                        }
                        .padding(.bottom)
                    }
                    .opacity(selectedTab == "Orders" ? 1 : 0)
                    ScrollView{
                        ForEach(1...25,id: \.self){ i in
                            NavigationLink(destination: Text("Rewards Data \(i)")) {
                                VStack(alignment:.leading){
                                    Text("Rewards data \(i)")
                                        .padding()
                                        .foregroundColor(.black)
                                    Divider()
                                }
                            }
                            
                        }
                        .padding(.bottom)
                    }
                    .opacity(selectedTab ==
                             "Rewards" ? 1 : 0)
                }
            }
            .onChange(of: selectedTab) { newValue in
                switch (selectedTab) {
                case "Restaurants": if
                    !modelData.isRestaurantsLoad { modelData.loadRestaurants() }
                case "Orders": if
                    !modelData.isOrderLoad { modelData.loadOrders() }
                case "Rewards": if
                    !modelData.isRewardLoad { modelData.loadRewards() }
                default : ()
                }
            }
            
            HStack(spacing:0){
                ForEach(modelData.tabs,id:\.self) { tab in
                    TabButton(title: tab, selectedTab: $selectedTab,animation: animation)
                    if tab != modelData.tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal,30)
            // for iphone like 8 and SE
            .padding(.bottom,edges?.bottom == 0 ? 15 : edges?.bottom)
            .background(Color.white)
            
        }
        .ignoresSafeArea(.all
                         ,edges: .bottom)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        
        .onAppear {
            
            // correct the transparency bug for Navigation bars
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



