//
//  ViewController.swift
//  Shopping List
//
//  Created by Hayden Kaci on 9/29/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit

class HomePageView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension HomePageView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemList", for: indexPath) as? ShoppingListCells
            else { return UITableViewCell() }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}
