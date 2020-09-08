//
//  UMRepositoryListViewController.swift
//  Umuzi Wshop4
//
//  Created by Urey Mutuale on 2020/09/03.
//  Copyright © 2020 Urey. All rights reserved.
//

import UIKit

class UMRepositoryListViewController: UIViewController {

    //Outlets
    @IBOutlet weak fileprivate(set) var listTableView: UITableView?
    
    
    fileprivate(set) var repositoryList: [Repository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting Tableviews protocols to this class
        self.listTableView?.dataSource = self
        self.listTableView?.delegate = self
        
        let cellNib = UINib(nibName: "UMRepoTableViewCell", bundle: Bundle.main)
        self.listTableView?.register(cellNib, forCellReuseIdentifier: "UMRepoTableViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.repositoryList = self.loadRepositories()
        
        self.listTableView?.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRepoDetail",
            let detailsViewController = segue.destination as? UMRepositoryDetailsViewController {
            detailsViewController.setRepository(sender as? Repository)
        }
    }
    
    private func loadRepositories() -> [Repository] {
        var repoList = [Repository]()
        
        let thotsanaRepo = Repository(imageUrlString: nil, name: "Repo Name ", authorName: "Thotsana")
        repoList.append(thotsanaRepo)
        
        
        let dumisaniRepo = Repository(imageUrlString: nil, name: "Repo Name ", authorName: "Dumisani")
        repoList.append(dumisaniRepo)
        
        
        let mamotlatsiRepo = Repository(imageUrlString: nil, name: "Repo Name ", authorName: "Mamotlatsi")
        repoList.append(mamotlatsiRepo)
        
        return repoList
    }

}


//MARK: UITableViewDataSource Implementation
extension UMRepositoryListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositoryList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var repostory: Repository? = nil
        if(indexPath.row < self.repositoryList.count) {
            repostory = self.repositoryList[indexPath.row]
        }
        
        //Create cell manually
//        let repoCell = UITableViewCell()
//        repoCell.textLabel?.text = "Section: \(indexPath.section) Row: \(indexPath.row)"
        
        //Dequeue Registered cell
        let repoCell = tableView.dequeueReusableCell(withIdentifier: "UMRepoTableViewCell", for: indexPath)
        
        
        if let repoCell = repoCell as? UMRepoTableViewCell {
            repoCell.loadDetailsForRepository(repostory)
        }
        
        return repoCell
    }
}

//MARK: UITableViewDataSource Implementation
extension UMRepositoryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var repostory: Repository? = nil
        if(indexPath.row < self.repositoryList.count) {
            repostory = self.repositoryList[indexPath.row]
        }
        
//        self.performSegue(withIdentifier: "showRepoDetail", sender: repostory)
        
        if let detailsViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "UMRepositoryDetailsViewController") as? UMRepositoryDetailsViewController {
            detailsViewController.setRepository(repostory)
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
