//
//  AirportsTableTableViewController.swift
//  Qantas
//
//  Created by Reza Farahani on 19/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import UIKit


protocol AirportsTableViewControllerDelegate {
    
    func getAirports(airports: [Airport])
}

class AirportsTableViewController: UITableViewController {
    
    // MARK: - global airport array
    var mAirport: [Airport] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // MARK: - tablleview nib loader
         tableView.register(UINib(nibName: "AirportsTableViewCell", bundle: nil), forCellReuseIdentifier: "airportCell")
    }

    // MARK: - tableView Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // MARK: - tableView Rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.mAirport.count
    }

    // MARK: - tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:AirportsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "airportCell", for: indexPath) as? AirportsTableViewCell)!
        
        cell.airportNameCode.text = self.mAirport[indexPath.row].displayName
        cell.airportTimeZone.text = self.mAirport[indexPath.row].code
        return cell
    }
 
    // MARK: - tableView height for header
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 35
    }

    // MARK: - tableView height for row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 59
    }
    
    // MARK: - tableView cell select
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let airportCode:String = mAirport[indexPath.row].code
      
        let foundAirports = AirportDAL.findByCode(mCode: airportCode)
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "airportDetails") as! AirportDetails
          vc.mAirports = foundAirports
         self.present(vc, animated: true, completion: nil)
    
    }
    
    // MARK: - tableView cell animation
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
        
    }
    
}
