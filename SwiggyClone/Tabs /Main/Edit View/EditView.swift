//
//  EditView.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 25/07/22.
//

import UIKit

class EditView: UIView {
    
    @IBOutlet var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    func initView(){
        Bundle.main.loadNibNamed("EditView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
}
