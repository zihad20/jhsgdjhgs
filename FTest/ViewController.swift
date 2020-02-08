//
//  ViewController.swift
//  FTest
//
//  Created by A on 04/02/2020.
//  Copyright © 2020 MatrixTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mtableView: UITableView!
    
    var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "Movies List", ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: path)
        
        data = dict!.object(forKey: "key") as! [String]
        
        for nn in data{
            print("N \(nn)")
        }
        
        print("W  \(data.count)")
        
        self.mtableView.dataSource = self
        self.mtableView.delegate = self
        
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String("Name Of Movies")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        for now in data{
            print("T  \(now)")
            if let mcell = self.mtableView.dequeueReusableCell(withIdentifier: "ViewController"){
                cell = mcell
            }
            else{
                cell = UITableViewCell()
            }
            cell.textLabel?.text = now
            return cell
        }
        return UITableViewCell()

    }
    
    
}
