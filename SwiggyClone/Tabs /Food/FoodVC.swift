//
//  FoodVC.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 12/07/22.
//

import Foundation
import UIKit
class FoodVC : UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
        
    var mainView = FoodView()
    var recordArray : [Int] = Array()
    var limit = 20
    let totalEntries = 100
    
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recordArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.lblText.text = "Item \(recordArray[indexPath.row])"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == recordArray.count - 1{
            if recordArray.count < totalEntries{
                var index = recordArray.count
                limit = index + 20
                while index < limit {
                    recordArray.append(index)
                    index += 1
                    
                }
                self.perform(#selector(loadData), with: nil, afterDelay: 1.0)
            }
        }
    }
    @objc func loadData(){
        self.mainView.paginationCollectioView.reloadData()
    }
    
    func setupUI() {
        mainView.txtField.placeholder = "Enter a text"
        self.mainView.paginationCollectioView.delegate = self
        self.mainView.paginationCollectioView.dataSource = self
        self.mainView.paginationCollectioView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        var index = 0
        while index < limit {
            recordArray.append(index)
            index += 1
            
        }
    }
}
