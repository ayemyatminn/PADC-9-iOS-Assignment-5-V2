//
//  ViewController.swift
//  Assignment 5
//
//  Created by Aye Myat Minn on 9/8/19.
//  Copyright © 2019 Aye Myat Minn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hotelTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hotelTableView.delegate = self
        hotelTableView.dataSource = self
        
        let hotelCell = UINib(nibName: String(describing: HotelTableViewCell.self), bundle: nil)
        hotelTableView.register(hotelCell, forCellReuseIdentifier: String(describing: HotelTableViewCell.self))
    }
}

extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HotelTableViewCell.self), for: indexPath) as! HotelTableViewCell
        return cell
    }
    
    
}

