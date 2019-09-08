//
//  SearchViewController.swift
//  Assignment 5
//
//  Created by Aye Myat Minn on 9/8/19.
//  Copyright © 2019 Aye Myat Minn. All rights reserved.
//

import UIKit
import FittedSheets

class SearchViewController: UIViewController {

    @IBOutlet weak var hotelCollectionView: UICollectionView!
    @IBOutlet weak var btnFilter: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hotelCollectionView.delegate = self
        hotelCollectionView.dataSource = self
        
        let tapFilter = UITapGestureRecognizer(target: self, action: #selector(onTapFilter(sender:)))
        btnFilter.addGestureRecognizer(tapFilter)
        
        let nib = UINib(nibName: String(describing: HotelCollectionViewCell.self), bundle: nil)
        hotelCollectionView.register(nib, forCellWithReuseIdentifier: String(describing: HotelCollectionViewCell.self))
        
        let layout = hotelCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: self.view.frame.width, height: 230)

    }
    
    @objc func onTapFilter(sender: UITapGestureRecognizer){
        let bottomSheet = SheetViewController(controller: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: BottomSheetViewController.self)), sizes: [.fixed(400),.fullScreen])
        self.present(bottomSheet, animated: true, completion: nil)
    }
}

extension SearchViewController: UICollectionViewDelegate{
    
}

extension SearchViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HotelCollectionViewCell.self), for: indexPath)
        return item
    }
    
    
}
