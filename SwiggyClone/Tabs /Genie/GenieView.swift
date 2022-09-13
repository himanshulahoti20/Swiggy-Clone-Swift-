//
//  GenieView.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 12/07/22.
//

import UIKit

class GenieView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pickAndDropCollectionView: UICollectionView!
    @IBOutlet weak var genieOfferCollectionView: UICollectionView!
    @IBOutlet weak var lblOne: ActiveLabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    func initView(){
        Bundle.main.loadNibNamed("GenieView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
   
}
