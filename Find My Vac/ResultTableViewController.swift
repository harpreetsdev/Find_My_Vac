//
//  ResultTableViewController.swift
//  Find My Vac
//
//  Created by Singh, Harpreet on 10/18/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import UIKit

class ResultTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var uprightVacuumTableView: UITableView!
    @IBOutlet weak var handVaccumTabelView: UITableView!
    @IBOutlet weak var canisterVacuumTableView: UITableView!
    @IBOutlet weak var vacuumTypeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        uprightVacuumTableView.delegate = self
        uprightVacuumTableView.dataSource = self
        uprightVacuumTableView.layer.cornerRadius = 8
        uprightVacuumTableView.clipsToBounds = true
        
        canisterVacuumTableView.delegate = self
        canisterVacuumTableView.dataSource = self
        canisterVacuumTableView.layer.cornerRadius = 8
        canisterVacuumTableView.clipsToBounds = true
        
        handVaccumTabelView.delegate = self
        handVaccumTabelView.dataSource = self
        handVaccumTabelView.layer.cornerRadius = 8
        handVaccumTabelView.clipsToBounds = true

    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        
    return cell

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//class CustomResultCell: UITableViewCell {
//    var thumbnailImageView:UIImageView?
//    var vacuumTypeLogo:UILabel?
//    var totalLabel:UILabel?
//    var disclosureImageView:UIImageView?
//    
//    
//    convenience init(thumbnailImageView:UIImageView, vacuumTypeLogo:UILabel, totalLabel:UILabel, disclosureImageView:UIImageView) {
//        
//        super.init()
//        
//        self.thumbnailImageView = thumbnailImageView
//        self.vacuumTypeLogo = vacuumTypeLogo
//        self.totalLabel = totalLabel
//        self.disclosureImageView = disclosureImageView
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
