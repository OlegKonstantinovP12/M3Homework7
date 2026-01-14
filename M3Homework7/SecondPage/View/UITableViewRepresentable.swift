//
//  UITableViewRepresentable.swift
//  M3Homework7
//
//  Created by Oleg Konstantinov on 14.01.2026.
//

import SwiftUI

struct UITableViewRepresentable: UIViewRepresentable {
    var model: [News]
    typealias UIViewType = UITableView
    
    func makeUIView(context: Context) -> UITableView {
        {
            $0.register(CustomCell.self, forCellReuseIdentifier: "news")
            $0.dataSource = context.coordinator
            $0.rowHeight = 94
            return $0
        }(UITableView(frame: .zero, style: .plain))
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        context.coordinator.parent = self
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    final class Coordinator: NSObject, UITableViewDataSource {
        var parent: UITableViewRepresentable
        
        init(parent: UITableViewRepresentable) {
            self.parent = parent
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return parent.model.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath) as? CustomCell {
                cell.setupCell(news: parent.model[indexPath.row])
                return cell
            }
//            let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath)
//            
//            
//            
//            var config = cell.defaultContentConfiguration()
//            config.text = parent.model[indexPath.row].title
//            config.textProperties.font = UIFont.lato(font: .black, size: 13)
//            
//            config.image = UIImage(named: parent.model[indexPath.row].image)
//            
//            
//            config.imageProperties.maximumSize = CGSize(width: 79, height: 79)
//            config.imageProperties.cornerRadius = 11
//            
//            config.secondaryText = parent.model[indexPath.row].releaseTime
//            config.secondaryTextProperties.font = .lato(font: .regular, size: 13)
//            
//            cell.contentConfiguration = config
            
            return UITableViewCell()
        }
    }
    
    final class CustomCell: UITableViewCell {
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            contentView.addSubview(newsImage)
            contentView.addSubview(titleLabel)
            contentView.addSubview(releaseLabel)
            setupConstraints()
            
        }
        
        private lazy var newsImage: UIImageView = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 11
            
            return $0
        }(UIImageView())

        private lazy var titleLabel: UILabel = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.numberOfLines = 0
            $0.font = .lato(font: .black, size: 13)
            return $0
        }(UILabel())
        private lazy var releaseLabel: UILabel = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = .lato(font: .regular, size: 13)
            $0.textColor = UIColor(red: 154/255, green: 149/255, blue: 140/255, alpha: 0.85)
            return $0
        }(UILabel())
        
        func setupCell(news: News) {
            newsImage.image = UIImage(named: news.image)
            titleLabel.text = news.title
            releaseLabel.text = news.releaseTime
            
        }

        private func setupConstraints() {
            NSLayoutConstraint.activate([
                newsImage.widthAnchor.constraint(equalToConstant: 79),
                newsImage.heightAnchor.constraint(equalTo: newsImage.widthAnchor, multiplier: 1),
                newsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                newsImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
                newsImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -9),
                
                titleLabel.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 13),
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                
                releaseLabel.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 13),
                releaseLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
                releaseLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
            ])
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
