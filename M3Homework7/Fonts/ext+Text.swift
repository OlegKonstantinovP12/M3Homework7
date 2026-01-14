//
//  ext+Text.swift
//  M3Homework7
//
//  Created by Oleg Konstantinov on 14.01.2026.
//

import SwiftUI



extension Text {
    func inter(font: InterType, size: CGFloat) -> some View {
        self
            .font(.custom(font.rawValue, size: size))
    }
    
    func lato(font: LatoType, size: CGFloat) -> some View {
        self
            .font(.custom(font.rawValue, size: size))
    }
}


