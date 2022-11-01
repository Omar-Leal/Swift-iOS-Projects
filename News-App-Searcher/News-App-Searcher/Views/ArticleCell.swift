//
//  ArticleCell.swift
//  News-App-Searcher
//
//  Created by Omar Leal on 10/29/22.
//

import UIKit

class NewsArticleViewModel {
    let title: String
    let subtitle: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(title: String, subtitle: String, imageURL: URL?) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
    }
}


class ArticleCell: UITableViewCell {
    
    static let cellIndetifier = "articleCell"
    
    private let ArticleCard: UIView = {
        let viewCard = UIView()
        viewCard.translatesAutoresizingMaskIntoConstraints = false
        viewCard.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        viewCard.layer.cornerRadius = 4
        viewCard.backgroundColor = .white
        viewCard.clipsToBounds = true
        viewCard.layer.shadowColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.04).cgColor
        viewCard.layer.shadowOpacity = 1
        viewCard.layer.shadowRadius = 20
        viewCard.layer.shadowOffset = CGSize(width: 0, height: 2)
        viewCard.layer.bounds = viewCard.bounds
        viewCard.layer.position = viewCard.center
        return viewCard
    }()
    
    /**  Article News Elements  */
    
    private let newsTitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 17, weight: .medium)
        title.font = UIFont(name: "Helvetica", size: 17)
        title.numberOfLines = 0
        return title
    }()
    
    private let subtitleLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 18, weight: .medium)
        return title
    }()
    
    private let newsImageView: UIImageView = {
        let newsImage = UIImageView()
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsImage.backgroundColor = .orange
        newsImage.contentMode = .scaleAspectFill
        return newsImage
    }()
    
    
    /**  Article News Elements  */
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(ArticleCard)
        ArticleCard.addSubview(newsTitleLabel)
        constraints()
        contentView.layer.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00).cgColor
  
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//    }
    
    
    func didMountState(with model: NewsArticleViewModel) {
        newsTitleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        
        if let data = model.imageData {
            newsImageView.image = UIImage(data: data)
        } else {
            // fetch the image
        }
        
    }
    
    
    private func constraints() {
        let articleCard = [
            ArticleCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ArticleCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            ArticleCard.heightAnchor.constraint(equalToConstant: 179),
            ArticleCard.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            ArticleCard.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let newsTitle =  [
            newsTitleLabel.topAnchor.constraint(equalTo: ArticleCard.topAnchor, constant: 18),
            newsTitleLabel.leadingAnchor.constraint(equalTo: ArticleCard.leadingAnchor, constant: 18),
            newsTitleLabel.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: -6),
            newsTitleLabel.widthAnchor.constraint(equalToConstant: 182.92),
            newsTitleLabel.heightAnchor.constraint(equalToConstant: 70)
        ]
        
        let image =  [
            newsImageView.trailingAnchor.constraint(equalTo: ArticleCard.trailingAnchor, constant: -12),
            newsImageView.topAnchor.constraint(equalTo: ArticleCard.topAnchor, constant: 18),
            newsImageView.widthAnchor.constraint(equalToConstant: 118),
            newsImageView.heightAnchor.constraint(equalToConstant: 132)
        ]
        
        NSLayoutConstraint.activate(articleCard)
        NSLayoutConstraint.activate(newsTitle)
        NSLayoutConstraint.activate(image)
        
    }
    
    
}



