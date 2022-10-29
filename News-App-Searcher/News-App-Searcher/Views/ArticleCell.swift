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
    
    
   /**  Article News Elements  */
    
    private let newsTitleLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 25, weight: .medium)
        return title
    }()
    
    private let subtitleLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 18, weight: .medium)
        return title
    }()
    
    private let newsImageView: UIImageView = {
        let newsImage = UIImageView()
        newsImage.backgroundColor = .orange
        newsImage.contentMode = .scaleToFill
        return newsImage
    }()
    
    
/**  Article News Elements  */
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [ newsTitleLabel, subtitleLabel, newsImageView  ].forEach(contentView.addSubview)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    
    
   
    
}
