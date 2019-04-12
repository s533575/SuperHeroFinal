//
//  SuperHerosTVCTableViewController.swift
//  SuperHeros_Laureates
//
//  Created by Student on 4/10/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class SuperHerosTVCTableViewController: UITableViewController {
 var powers:[String] = []
    var member : [Members] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSuperHero()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func fetchSuperHero(){
        let urlSession = URLSession.shared
        let url = URL(string: "https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json")
        let url1 = URL(string: "https://raw.githubusercontent.com/materialsproject/workshop-2017/master/mongo-primer/nobel_laureates.json")
        print(url1!)
        urlSession.dataTask(with: url!, completionHandler: displaySuperHero).resume()
    }
    
    func displaySuperHero(data:Data?, urlResponse:URLResponse?, error:Error?)->Void {
        print("Inside display super hero method")
        do {
            let decoder:JSONDecoder = JSONDecoder()
            let superhero = try decoder.decode(Superhero.self, from: data!)
            self.member = superhero.members
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
        return member.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "superhero", for: indexPath)
        
        // Configure the cell...
        let hero = member[indexPath.row]
        self.powers = hero.powers
        var powers1 : String = ""
        for i in 0..<powers.count
        {
            if i<powers.count-1
            {
            powers1 = powers1 + "\(powers[i]),"
            }
            else
            {
                 powers1 = powers1 + "\(powers[i])"
            }
        }
        cell.textLabel?.text = "\(hero.name) (AKA: \(hero.secretIdentity)) "
          cell.detailTextLabel?.text = powers1
        return cell
    }
}

