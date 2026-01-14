//
//  ContentViewViewModel.swift
//  M3Homework7
//
//  Created by Oleg Konstantinov on 14.01.2026.
//

import Combine

class ContentViewViewModel: ObservableObject {
    @Published var person: [PersonPage] = []
    
    
    func getPerson() {
        let request = NetworkManager.getData()
        self.person = request
    }
}
