//
//  SecondPage.swift
//  M3Homework7
//
//  Created by Oleg Konstantinov on 14.01.2026.
//

import SwiftUI

struct SecondPage: View {
    @StateObject var viewModel = SecondPageViewModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 36) {
            Text("Новости")
                .lato(font: .black, size: 34)
            UITableViewRepresentable(model: viewModel.news)
        }
        .padding(.leading, 30)
        .padding(.trailing, 30)
        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear {
            viewModel.getNews()
        }
            
    }
        
        
}

#Preview {
    SecondPage()
}
