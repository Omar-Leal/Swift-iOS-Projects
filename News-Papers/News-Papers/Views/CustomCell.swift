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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(card)
        contentView.backgroundColor = .red
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraints() {
        let cards = [
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            card.heightAnchor.constraint(equalToConstant: 168)
        ]
        
        NSLayoutConstraint.activate(cards)
    }
}
