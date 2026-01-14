//
//  ContentView.swift
//  M3Homework7
//
//  Created by Oleg Konstantinov on 14.01.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ForEach(viewModel.person) { item in
                    VStack(spacing: 39) {
                        VStack(spacing: 19) {
                            UIImageViewRepresentable(imageName: item.avatar)
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 40))
                            Text(item.name)
                                .inter(font: .black, size: 20)
                        }
                        VStack(spacing: 52) {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("О себе")
                                    .inter(font: .bold, size: 12)
                                Text(item.description)
                                    .inter(font: .regular, size: 12)
                                    .padding(.vertical, 20)
                                    .padding(.leading, 13)
                                    .padding(.trailing, 15)
                                    .background(.whiteMarble)
                                    .clipShape(RoundedRectangle(cornerRadius: 14))
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Фото")
                                .inter(font: .bold, size: 12)
                            HStack(spacing: 10) {
                            ForEach(item.posts) { photo in
                                    UIImageViewRepresentable(imageName: photo.image)
                                        .frame(width: 180, height: 180)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                            }
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    UIButtonRepresentable {
                        print("Action")
                        path.append("Second page")
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                }
                
            }
            .navigationDestination(for: String.self, destination: { item in
                SecondPage()
            })
            .padding(.horizontal, 20)
            .onAppear {
                viewModel.getPerson()
            }
        }

    }
}

#Preview {
    ContentView()
}
