//
//  Repository.swift
//  Umuzi Wshop4
//
//  Created by Urey Mutuale on 2020/09/03.
//  Copyright © 2020 Urey. All rights reserved.
//

import UIKit

class Repository: NSObject {

    var imageUrlString: String?
    var name: String?
    var authorName: String?
    
    init(imageUrlString: String?, name: String?, authorName: String?) {
        super.init()
        self.imageUrlString = imageUrlString
        self.name = name
        self.authorName = authorName
    }
}
