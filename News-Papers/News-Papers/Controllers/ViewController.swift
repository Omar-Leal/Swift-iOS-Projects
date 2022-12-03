//
//  ViewController.swift
//  News-Papers
//
//  Created by Omar Leal on 11/4/22.
//

import UIKit

class ViewController: UIViewController  {
    
     private var loadedData = [ NewArticleViewModel ]()
    
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellID)
        table.backgroundColor = .magenta
        table.rowHeight = 200
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "News Papers"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
       
        // Do any additional setup after loading the view.
        
        FetchNews.shared.getAllNewsRow(completion: { [weak self] response in
            switch response {
            case .success(let articles):
                self?.loadedData = articles.compactMap({
                    NewArticleViewModel(title: $0.title,
                                        subtitle: $0.description ?? "",
                                        imageURL: $0.urlToImage ?? ""
                                        )
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                break
            case .failure(let errorResponse):
                print(errorResponse)
                break
            }
           
        })
        
    }

    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellID, for: indexPath) as! CustomCell
        cell.withData(with: loadedData[indexPath.row])
        cell.layer.opacity = 0
        return cell
    }
    
}
