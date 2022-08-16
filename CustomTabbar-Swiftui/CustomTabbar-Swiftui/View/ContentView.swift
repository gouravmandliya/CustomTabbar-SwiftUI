//
//  ContentView.swift
//  CustomTabbar-Swiftui
//
//  Created by GOURAVM on 12/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        NavigationView{
            Home()
                .navigationBarTitle("Food App")
                .navigationBarTitleDisplayMode(.inline)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
