//
//  MainNavigationController.swift
//  Meet the Team
//
//  Created by Reiaz Gafar on 6/15/18.
//  Copyright © 2018 Reiaz Gafar. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .white
        navigationBar.barTintColor = Styles.Color.cmbBlue
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }

}
