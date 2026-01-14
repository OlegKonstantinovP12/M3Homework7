//
//  UIImageViewRepresentable.swift
//  M3Homework7
//
//  Created by Oleg Konstantinov on 14.01.2026.
//

import SwiftUI

struct UIImageViewRepresentable: UIViewRepresentable {
    var imageName: String
    
    
    func makeUIView(context: Context) -> some UIImageView {
        {
            $0.image = UIImage(named: imageName)
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            
            return $0
        }(UIImageView())
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: UIViewType, context: Context) -> CGSize? {
        if let width = proposal.width, let height = proposal.height {
            return CGSize(width: width, height: height)
        } else {
            return uiView.image?.size
        }
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }

}
