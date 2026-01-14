//
//  PersonPage.swift
//  M3Homework7
//
//  Created by Oleg Konstantinov on 14.01.2026.
//
import Foundation


struct PersonPage: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let name: String
    let avatar: String
    let description: String
    let posts: [Post]
}

struct Post: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let image: String
}
