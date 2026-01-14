//
//  UIButtonRepresentable.swift
//  M3Homework7
//
//  Created by Oleg Konstantinov on 14.01.2026.
//

import SwiftUI

struct UIButtonRepresentable: UIViewRepresentable {
    typealias UIViewType = UIButton
    
    var addAction: () -> Void
    
    func makeUIView(context: Context) -> UIButton {
        {
            $0.setTitle("Редактировать", for: .normal)
            $0.backgroundColor = .blue
            $0.tintColor = .white
            $0.addAction(UIAction(handler: { _ in
                addAction()
            }), for: .touchUpInside)
            return $0
        }(UIButton())
    }
    func updateUIView(_ uiView: UIButton, context: Context) {
        
    }
}
