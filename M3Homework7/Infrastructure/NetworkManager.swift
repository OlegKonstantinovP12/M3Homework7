//
//  NetworkManager.swift
//  M3Homework7
//
//  Created by Oleg Konstantinov on 14.01.2026.
//

import Foundation

struct NetworkManager {
    static func getData() -> [PersonPage] {
        [
            PersonPage(name: "Имя Фамилия", avatar: "avatar", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo", posts: [Post(image: "img1"), Post(image: "img2")])
        ]
        
    }
    
    static func getNews() -> [News] {
        [
            News(image: "news1", title: "Apple разрешила альтернативы Apple Pay в Европе. Ждем Mir Pay для Айфона в России?", releaseTime: "2026-01-14 05:06:19"),
            News(image: "news2", title: "Свежие подробности об Айфон 16: новая батарея с защитой от перегрева, крутой процессор и iOS 18 с ИИ", releaseTime: "2026-01-14 06:06:19"),
            News(image: "news3", title: "Правда ли, что Айфон 12 сняли с продажи из-за опасного излучения, которое вредит здоровью", releaseTime: "2026-01-14 07:06:19"),
            News(image: "news4", title: "Тим Кук рассказал, что думает про VR-очки Apple Vision Pro и как выгодно купить Айфон в кризис", releaseTime: "2026-01-14 08:06:19"),
            News(image: "news1", title: "Apple разрешила альтернативы Apple Pay в Европе. Ждем Mir Pay для Айфона в России?", releaseTime: "2026-01-14 05:06:19"),
            News(image: "news2", title: "Свежие подробности об Айфон 16: новая батарея с защитой от перегрева, крутой процессор и iOS 18 с ИИ", releaseTime: "2026-01-14 06:06:19"),
            News(image: "news3", title: "Правда ли, что Айфон 12 сняли с продажи из-за опасного излучения, которое вредит здоровью", releaseTime: "2026-01-14 07:06:19"),
            News(image: "news4", title: "Тим Кук рассказал, что думает про VR-очки Apple Vision Pro и как выгодно купить Айфон в кризис", releaseTime: "2026-01-14 08:06:19"),
        ]
    }
}


