//
//  News.swift
//  M3Homework7
//
//  Created by Oleg Konstantinov on 14.01.2026.
//

import Foundation


struct News: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let image: String
    let title: String
    let releaseTime: String
}
