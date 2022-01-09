//
//  ViewController.swift
//  Valentina Photos
//
//  Created by Omar Leal on 1/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 8
        return imageView;
    }()
    
    private let nextPhoto: UIButton = {
        let customButton = UIButton()
        customButton.backgroundColor = .white
        customButton.setTitle("Get Random Photo", for: .normal)
        customButton.setTitleColor(.black, for: .normal)
        return customButton;
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // view.backgroundColor = .systemPink
        view.layer.backgroundColor = UIColor(red: 0.83, green: 0.77, blue: 0.98, alpha: 1).cgColor
        view.addSubview( imageView )
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.layer.cornerRadius = 8
        imageView.center = view.center
        
        view.addSubview(nextPhoto)
        
        // Getting photos
        gettingPhotos()
        // bind actions
        nextPhoto.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    }
    
    @objc func actionButton() { gettingPhotos() }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nextPhoto.frame = CGRect(
            x: 30,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55
        )
        nextPhoto.layer.cornerRadius = 8
    }
    
    func gettingPhotos(){
        let api = "https://source.unsplash.com/random/600x600"
        let urlString = URL(string: api)!
        guard let data = try? Data(contentsOf: urlString) else {
            return
        }
        imageView.image = UIImage(data: data)
        imageView.layer.cornerRadius = 8.0;
    }
    
   
    

}

