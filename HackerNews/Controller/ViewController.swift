//
//  ViewController.swift
//  HackerNews
//
//  Created by GGS-BKS on 10/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    
    var hitsArray : [Hits] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        ApiManager().getNewsFrom(url: "https://hn.algolia.com/api/v1/search?tags=front_page") { response in
            self.hitsArray = response.hits ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hitsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell
        cell?.setData(title:hitsArray[indexPath.row].title)
        return cell!
    }
}
