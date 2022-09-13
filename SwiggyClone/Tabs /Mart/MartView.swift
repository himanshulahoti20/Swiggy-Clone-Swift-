//
//  MartView.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 12/07/22.
//

import UIKit

class MartView: UIView {
    
    
    @IBOutlet weak var oneLabel: ActiveLabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var coupounCollectionView: UICollectionView!
    @IBOutlet weak var comoditiesCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    func initView(){
        Bundle.main.loadNibNamed("MartView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
}
