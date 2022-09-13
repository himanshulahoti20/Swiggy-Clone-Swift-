//
//  ProfileView.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 23/07/22.
//

import UIKit

class ProfileView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    var objProfile : ProfileVC!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    func initView(){
        Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        let objEdit = EditVC()
        objProfile.navigationController?.pushViewController(objEdit, animated: true)
        print("Edit tapped")
    }
    
}
