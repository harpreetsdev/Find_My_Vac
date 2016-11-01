//
//  ResultTableViewController.swift
//  Find My Vac
//
//  Created by Singh, Harpreet on 10/18/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import UIKit

class ResultTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    @IBAction func backButtonTap(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
    }
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
        uprightVacuumTableView.tag = 1
        
        canisterVacuumTableView.delegate = self
        canisterVacuumTableView.dataSource = self
        canisterVacuumTableView.layer.cornerRadius = 8
        canisterVacuumTableView.clipsToBounds = true
        canisterVacuumTableView.tag = 2

        handVaccumTabelView.delegate = self
        handVaccumTabelView.dataSource = self
        handVaccumTabelView.layer.cornerRadius = 8
        handVaccumTabelView.clipsToBounds = true
        handVaccumTabelView.tag = 3

    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomResultCell
    
        
        switch tableView.tag {
        case 1:
            //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomResultCell

            cell.vacuumTypeLabel?.text = "UprightVacs"
            cell.totalNumLabel?.text = "10"
            
        case 2:
            //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomResultCell

            cell.vacuumTypeLabel?.text = "Canistervacuums1"
            cell.totalNumLabel?.text = "15"
        case 3:
            //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomResultCell

            cell.vacuumTypeLabel?.text = "Handheldvacuums2"
            cell.totalNumLabel?.text = "10"
        default:
           // let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomResultCell

            cell.vacuumTypeLabel?.text = ""
        }
        
        
        
    return cell

    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        print("Tapped on table number \(tableView.tag)")
    }
    
//    func returnCustomCell(thumbnailImageView:UIImageView, vacuumTypeLogo:UILabel, totalLabel:UILabel, disclosureImageView:UIImageView)->UITableViewCell{
//    
//        var thumbnailImageView:UIImageView
//        var vacuumTypeLogo:UILabel
//        var totalLabel:UILabel
//        var disclosureImageView:UIImageView
//        
//    }
    
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

class CustomResultCell: UITableViewCell {
//    var disclosureImageView = UIImageView()
    
    @IBOutlet weak var vacuumTypeLabel = UILabel()
    @IBOutlet weak var totalNumLabel = UILabel()
    @IBOutlet weak var thumbnailImgView = UIImageView()
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
