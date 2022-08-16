//
//  TabButton.swift
//  CustomTabbar-Swiftui
//
//  Created by GOURAVM on 16/08/22.
//

import SwiftUI

struct TabButton: View {
    
    @Binding var selectedTab:String
    
    var title :String
    var animation:Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation {
                selectedTab = title
            }
            
        }) {
            VStack(spacing:6){
                
                //Custom shape
                ZStack {
                    CustomShape()
                        .fill(Color.green.opacity(selectedTab == title ? 1 : 0))
                        .frame(width: 45, height: 6, alignment: .center)
                        .padding(.bottom,10)
                    if selectedTab ==  title {
                        CustomShape()
                            .fill(Color.green)
                            .frame(width: 45, height: 6)
                            .padding(.bottom,10)
                            .matchedGeometryEffect(id: "Tab_Change", in: animation)
                    }
                }
              
                Image(title)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(selectedTab == title ? Color.green : Color.black.opacity(0.2))
                    .frame(width: 24, height: 24, alignment: .center)
                Text(title)
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(selectedTab == title ? 0.6 : 0.2))
            }
        }
    }
}

