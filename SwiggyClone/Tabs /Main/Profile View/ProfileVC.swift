//
//  ProfileVC.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 22/07/22.
//

import Foundation
import UIKit
class ProfileVC : UIViewController{
    
    var mainView = ProfileView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.objProfile = self
    }
}
