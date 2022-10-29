//
//  ViewController.swift
//  News-App-Searcher
//
//  Created by Omar Leal on 10/29/22.
//

/**
 
 1. Create a TableView
 2. Create a Custom Cell
 3. Call the Api and save the data
 4. Open the New Story
 5. Search for news Storys
 
 00b05f9e03cc4b958e462fcfe0608879
 
 curl https://newsapi.org/v2/everything -G \
     -d q=Apple \
     -d from=2022-10-29 \
     -d sortBy=popularity \
     -d apiKey=00b05f9e03cc4b958e462fcfe0608879
 
 */

import UIKit

class HomeVC: UIViewController, UITableViewDelegate {
   
    private var titles: String?
    
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The News Searcher"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        ApiHandler.shared.getAllNews(completionHandlers: { results in
            
            switch results {
            case .success(let response):
             
                print(response)
                break
            case .failure(let error):
                print(error)
                break
            }
            
        })
        
       
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension HomeVC: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Testing out"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
    }
    
}
