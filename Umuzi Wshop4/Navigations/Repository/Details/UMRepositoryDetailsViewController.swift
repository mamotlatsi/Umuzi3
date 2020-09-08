//
//  UMRepositoryDetailsViewController.swift
//  Umuzi Wshop4
//
//  Created by Urey Mutuale on 2020/09/03.
//  Copyright © 2020 Urey. All rights reserved.
//

import UIKit

class UMRepositoryDetailsViewController: UIViewController {

    //Outlets
    @IBOutlet fileprivate(set) var avatarImageView : UIImageView?
    @IBOutlet fileprivate(set) var nameLabel : UILabel?
    @IBOutlet fileprivate(set) var authorLabel : UILabel?
    
    fileprivate(set) var repository: Repository?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadDetailsForCurrentRepository()
    }

    //Private functions
    private func loadDetailsForCurrentRepository() {
        if let repository = self.repository {
            self.nameLabel?.text = "\(repository.name ?? "-")"
            self.authorLabel?.text = "\(repository.authorName ?? "-")"
        }
    }
    
    //Public functions 
    func setRepository(_ repository: Repository?) {
        self.repository = repository
    }
}
