//
//  MartVC.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 12/07/22.
//

import Foundation
import UIKit
class MartVC : UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var mainView = MartView()
    var coupons = ["coupon1","coupon2"]
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        intialView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView) == self.mainView.coupounCollectionView{
        return coupons.count
        } else {
            return comodity.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mainView.coupounCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoupounCell", for: indexPath) as! CoupounCell
            cell.coupounImage.image = UIImage(named: coupons[indexPath.row])
            return cell
        } else if collectionView == self.mainView.comoditiesCollectionView{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ComoditiesCell", for: indexPath) as! ComoditiesCell
            cell2.comodityImage.image = UIImage(named: comodity[indexPath.row].image)
            cell2.configureCell(with: comodity[indexPath.row])
            return cell2
        }
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "ComoditiesCell", for: indexPath)
        return cell3
    }
    
    
    func setupUI(){
        self.mainView.coupounCollectionView.delegate = self
        self.mainView.coupounCollectionView.dataSource = self
        self.mainView.coupounCollectionView.register(UINib(nibName: "CoupounCell", bundle: nil), forCellWithReuseIdentifier: "CoupounCell")
        self.mainView.comoditiesCollectionView.delegate = self
        self.mainView.comoditiesCollectionView.dataSource = self
        self.mainView.comoditiesCollectionView.register(UINib(nibName: "ComoditiesCell", bundle: nil), forCellWithReuseIdentifier: "ComoditiesCell")
    }
    
    func intialView() {
        let customtype = ActiveType.custom(pattern: "\\sBuy @75/month\\b")
        self.mainView.oneLabel.text = "Get extra discounts on 1000+ popular items & free delivery above Rs 99! Buy @75/month"
        self.mainView.oneLabel.enabledTypes.append(customtype)
        self.mainView.oneLabel.customColor[customtype] = UIColor.red
        self.mainView.oneLabel.handleCustomTap(for: customtype) { self.alert("Custom type", message: $0) }
    }
    
    func alert(_ title: String, message: String) {
        let vc = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        vc.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(vc, animated: true, completion: nil)
    }
    
}
