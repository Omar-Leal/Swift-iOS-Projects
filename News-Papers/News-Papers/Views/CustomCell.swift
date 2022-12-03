//
//  CustomCell.swift
//  News-Papers
//
//  Created by Omar Leal on 11/4/22.
//

import UIKit

class CustomCell: UITableViewCell {
    
    static let cellID: String = "CustomCell"
    
    private let card:UIView = {
       let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    private let title: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.backgroundColor = UIColor.purple.cgColor
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(card)
        card.addSubview(title)
        card.addSubview(image)
        contentView.backgroundColor = .red
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraints() {
        let cards = [
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            card.heightAnchor.constraint(equalToConstant: 191)
        ]
        
        let titles =  [
            title.topAnchor.constraint(equalTo: card.topAnchor, constant: 17),
            title.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            title.widthAnchor.constraint(equalToConstant: 182.92)
        ]
  
        let imageView =  [
            image.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 6.71),
            image.topAnchor.constraint(equalTo: card.topAnchor, constant: 16),
            image.widthAnchor.constraint(equalToConstant: 118),
            image.heightAnchor.constraint(equalToConstant: 132),
            image.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -12)
        ]
        
        NSLayoutConstraint.activate(cards)
        NSLayoutConstraint.activate(titles)
        NSLayoutConstraint.activate(imageView)
    }
    
    func withData(with model: NewArticleViewModel){
        title.text = model.title
        
        if let data = model.imageData {
            image.image = UIImage(data: data)
        } else {
            
        }
    }
}
