//
//  GenieVC.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 12/07/22.
//

import Foundation
import UIKit
class GenieVC : UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    var genieOfferImages =  ["offer1","offer2"]
    var mainView = GenieView()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        initiateView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView) == self.mainView.genieOfferCollectionView{
        return genieOfferImages.count
        }else{
        return displayItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == self.mainView.genieOfferCollectionView){
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenieOfferCell", for: indexPath) as! GenieOfferCell
        cell.genieOfferImage.image = UIImage(named: genieOfferImages[indexPath.row])
        return cell
        }else if (collectionView ==  self.mainView.pickAndDropCollectionView){
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "PickandDropCell", for: indexPath) as! PickandDropCell
            cell2.itemImage.image = UIImage(named: displayItems[indexPath.row].itemImage)
            cell2.itemName.text = displayItems[indexPath.row].itemName
            return cell2
        }
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "PickandDropCell", for: indexPath)
        return cell3
    }
    
    func setupUI() {
        self.mainView.genieOfferCollectionView.dataSource = self
        self.mainView.genieOfferCollectionView.delegate = self
        self.mainView.genieOfferCollectionView.register(UINib(nibName: "GenieOfferCell", bundle: nil), forCellWithReuseIdentifier: "GenieOfferCell")
        self.mainView.genieOfferCollectionView.isPagingEnabled = true
        self.mainView.pickAndDropCollectionView.dataSource = self
        self.mainView.pickAndDropCollectionView.delegate = self
        self.mainView.pickAndDropCollectionView.register(UINib(nibName: "PickandDropCell", bundle: nil), forCellWithReuseIdentifier: "PickandDropCell")
    }
    func initiateView() {
        let customType = ActiveType.custom(pattern: "\\sBuy @75/month\\b")
        self.mainView.lblOne.text = "Get 10% off on Geneie delivery fee & exclusive benefit across Swiggy Buy @75/month "
        self.mainView.lblOne.enabledTypes.append(customType)
        self.mainView.lblOne.customColor[customType] = UIColor.orange
        self.mainView.lblOne.handleCustomTap(for: customType) { self.alert("Custom type", message: $0) }
    }

    func alert(_ title: String, message: String) {
        let vc = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        vc.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(vc, animated: true, completion: nil)
    }
}


