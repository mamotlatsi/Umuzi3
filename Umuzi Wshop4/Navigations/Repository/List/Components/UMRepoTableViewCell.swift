//
//  UMRepoTableViewCell.swift
//  Umuzi Wshop4
//
//  Created by Urey Mutuale on 2020/09/03.
//  Copyright © 2020 Urey. All rights reserved.
//

import UIKit

class UMRepoTableViewCell: UITableViewCell {

    @IBOutlet weak fileprivate(set) var avatarImageView : UIImageView?
    @IBOutlet weak fileprivate(set) var nameLabel : UILabel?
    @IBOutlet weak fileprivate(set) var authorLabel : UILabel?
    
    fileprivate(set) var repository: Repository?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func loadDetailsForRepository(_ repository: Repository?) {
        self.repository = repository
        
        if let repository = repository {
            self.nameLabel?.text = "\(repository.name ?? "-")"
            self.authorLabel?.text = "\(repository.authorName ?? "-")"
        }
    }
}
