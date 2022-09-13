//
//  MainView.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 12/07/22.
//

import UIKit

class MainView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var offerCollectionView: UICollectionView!
    @IBOutlet weak var resturantCollectionView: UICollectionView!
    
    var objMain : MainVC!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    func initView(){
        Bundle.main.loadNibNamed("MainView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    @IBAction func btnTap(_ sender: UIButton) {
        let objProfile = ProfileVC()
        objMain.navigationController?.pushViewController(objProfile, animated: true)
    }
    
}
