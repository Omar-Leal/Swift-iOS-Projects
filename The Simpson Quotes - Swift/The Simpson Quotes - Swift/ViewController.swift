//
//  ViewController.swift
//  The Simpson Quotes - Swift
//
//  Created by Omar Leal on 12/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    let getAllQuotes = QuotesManager()
    
    
    private let theSimpsonLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo_")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let quoteText: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        text.textAlignment = .center
        text.font = .systemFont(ofSize: 18, weight: .medium)
        text.textColor = .white
        text.lineBreakMode = .byWordWrapping
        return text
    }()
    
    private let characterImage: UIImageView = {
       let characterImage = UIImageView()
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.contentMode = .scaleAspectFit
        return characterImage
    }()
    
    private lazy var getQuoteButton: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Simposon's Quote"
        config.buttonSize = .large
        config.baseForegroundColor = .white
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.didGetQuote()
        }))
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.02, green: 0.02, blue: 0.02, alpha: 1.00)
        [theSimpsonLogo, characterImage, quoteText, getQuoteButton ].forEach(view.addSubview)
        didLoadConstraints()
        getAllQuotes.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    private func didLoadConstraints() {
        let logo = [
            theSimpsonLogo.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 2),
            theSimpsonLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            theSimpsonLogo.widthAnchor.constraint(equalToConstant: 300),
            theSimpsonLogo.heightAnchor.constraint(equalToConstant: 200)
        ]
        
        let button =  [
            getQuoteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getQuoteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80)
            
        ]
        
        let characterIMG = [
            characterImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImage.topAnchor.constraint(equalTo: theSimpsonLogo.bottomAnchor, constant: 20),
            characterImage.widthAnchor.constraint(equalToConstant: 200),
            characterImage.heightAnchor.constraint(equalToConstant: 200)
        ]
        
        let quoteText = [
            quoteText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quoteText.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 10),
            quoteText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            quoteText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ]
        
        
        
        NSLayoutConstraint.activate(logo)
        NSLayoutConstraint.activate(button)
        NSLayoutConstraint.activate(quoteText)
        NSLayoutConstraint.activate(characterIMG)
    }
    
    
    
    func didGetQuote() {
        getAllQuotes.callApi()
    }
    
}

// extension matching with the especial delegate api protocol
extension ViewController: ApiDelegate {
    func update(quotes: [QuoteModel]) {
        self.quoteText.loadText(getText: quotes[0].quote)
        self.characterImage.load(url: URL(string: quotes[0].image)!)
    }
    
    
}

extension UILabel {
    func loadText(getText: String) {
        DispatchQueue.main.async {
            self.text = getText
        }
    }
}


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
