//
//  ext+UIFont.swift
//  M3Homework7
//
//  Created by Oleg Konstantinov on 14.01.2026.
//
import UIKit


extension UIFont {
    static func lato(font: LatoType, size: CGFloat) -> UIFont {
        .init(name: font.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
