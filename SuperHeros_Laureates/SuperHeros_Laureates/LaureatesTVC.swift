//
//  LaureatesTVC.swift
//  SuperHeros_Laureates
//
//  Created by Student on 4/10/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class LaureatesTVC: UITableViewController {
    //var powers:[String] = []
    var laureates1 : [[String:Any]]!
    var laureates2:[String:Any]!
    var laureates3:[Laureate] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLaureates()
    }
    
    func fetchLaureates(){
        let urlSession = URLSession.shared
        let url = URL(string: "https://www.dropbox.com/s/7dhdrygnd4khgj2/laureates.json?dl=1")
        urlSession.dataTask(with: url!, completionHandler: displayLaureates).resume()
    }
    
    func displayLaureates(data:Data?, urlResponse:URLResponse?, error:Error?)->Void {
        print("Inside display laureates method")
        do {
            try laureates1 = JSONSerialization.jsonObject(with:data!, options: .allowFragments) as?
                [[String:Any]]
            for i in 0..<laureates1.count
            {
                laureates2 = laureates1[i]
                let id = laureates2["id"] as? String
                let fname = laureates2["firstname"] as? String
                let surname = laureates2["surname"] as? String
                let born = laureates2["born"] as? String
                let died = laureates2["died"] as? String
                laureates3.append(Laureate(id: id, firstname: fname, surname: surname, born: born, died: died))
            }
            
            for laur in laureates3{
                print(laur)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            //print(self.superhero)
        } catch {
            print(error)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return laureates3.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "laureates", for: indexPath)
        let laureate = laureates3[indexPath.row]
        
        let custom1 = cell.viewWithTag(100) as! UILabel
        let custom2 = cell.viewWithTag(200) as! UILabel
        
        custom1.text = "\(laureate.firstname ?? "NA")\(laureate.surname ?? "NA")"
        custom2.text = "\(laureate.born ?? "NA") \(laureate.died ?? "NA")"
        return cell
    }

}
