//
//  SecondPageViewModel.swift
//  M3Homework7
//
//  Created by Oleg Konstantinov on 14.01.2026.
//
import Foundation
import Combine


class SecondPageViewModel: ObservableObject {
    @Published var news: [News] = []
    private let stringToDate: DateFormatter = {
        $0.timeZone = TimeZone(identifier: "UTC")
        $0.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return $0
    }(DateFormatter())
    
    private let releaseDate: RelativeDateTimeFormatter = {
        $0.locale = Locale(identifier: "ru_RU")
        return $0
    }(RelativeDateTimeFormatter())
    
    func getNews() {
        let request = NetworkManager.getNews()
        self.news = request.map({ item in
            guard let text = stringToDate.date(from: item.releaseTime)  else {
                return News(image: item.image, title: item.title, releaseTime: item.releaseTime)
            }
            
            return News(image: item.image, title: item.title, releaseTime: releaseDate.localizedString(for: text, relativeTo: .now))
        })
        
//        self.news = request.map({ item in
//            News(image: item.image, title: item.title, releaseTime: releaseDate(item.releaseTime))
//        })
        
    }
    
//    private func stringToDate(_ string: String) -> Date? {
//        let formatter = DateFormatter()
//        formatter.timeZone = TimeZone(identifier: "UTC")
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        
//        return formatter.date(from: string)
//    }
//    private func releaseDate(_ releaseDate: String) -> String {
//        let formatter = RelativeDateTimeFormatter()
//        if let timeAgo = stringToDate(releaseDate) {
//            formatter.locale = Locale(identifier: "ru_RU")
//            let text = formatter.localizedString(for: timeAgo, relativeTo: .now)
//            
//            return text
//        }
//        return ""
//    }
}
