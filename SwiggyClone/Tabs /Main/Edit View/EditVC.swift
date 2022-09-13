//
//  EditVC.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 25/07/22.
//

import Foundation
import UIKit
class EditVC : UIViewController{
    
    var mainView = EditView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
