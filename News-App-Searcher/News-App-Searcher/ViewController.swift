import UIKit

class HomeVC: UIViewController, UITableViewDelegate {
   
    private var titles: String?
    private var loadedData = [NewsArticleViewModel]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.cellIndetifier)
       // table.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
      // table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.layer.shadowOffset = CGSizeMake(0, 0)
        table.layer.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        table.layer.shadowOpacity = 0.23
        table.layer.shadowRadius = 2.0
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /**  Notch and Safe Area Color*/
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        /**  Notch and Safe Area Color*/
        
        view.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
        title = "The News Searcher"
        navigationController?.navigationBar.prefersLargeTitles = true
        
       // navigationController?.navigationBar.backgroundColor = UIColor.brown
       
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
      
        
        ApiHandler.shared.getAllNews(completionHandlers: { [ weak self ] results in
            
            switch results {
            case .success(let articles):
                self?.loadedData = articles.compactMap({
                    NewsArticleViewModel(title: $0.title,
                                         subtitle: $0.description ?? "No description given",
                                         imageURL: URL(string: $0.urlToImage ?? ""
                                                      
                                        ))
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                break
            case .failure(let error):
                print(error)
                break
            }
            
        }
        
       
    )
        
     
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
    }


//    private func constraints() {
//
//        let tables =  [
//            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ]
//
//        NSLayoutConstraint.activate(tables)
//
//    }
    
  
    
   
    
}

extension HomeVC: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.cellIndetifier, for: indexPath) as? ArticleCell else {
            fatalError()
        }
        cell.didMountState(with: loadedData[indexPath.row])
        cell.backgroundColor = .purple
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
        print("Clicking \(loadedData[indexPath.row].title)")
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
}
