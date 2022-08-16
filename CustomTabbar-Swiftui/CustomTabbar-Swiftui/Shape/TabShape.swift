//
//  TabShape.swift
//  CustomTabbar-Swiftui
//
//  Created by GOURAVM on 16/08/22.
//

import SwiftUI

struct CustomShape:Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        return Path(path.cgPath)
    }
}
