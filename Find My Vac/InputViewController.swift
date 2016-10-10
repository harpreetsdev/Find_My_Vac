//
//  InputViewController.swift
//  Find My Vac
//
//  Created by HARPREET SINGH on 10/9/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var livingAreaPickerView: UIPickerView!
    @IBOutlet weak var petPickerView: UIPickerView!
    @IBOutlet weak var hardwoodPercent: UITextField!
    @IBOutlet weak var woodenFloorPercent: UITextField!
    var vacuumType:String?
    var petArray = ["YES","NO"]
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
    
        super.viewDidLoad()
        hardwoodPercent.delegate = self
        woodenFloorPercent.delegate = self
        petPickerView.delegate = self
        livingAreaPickerView.delegate = self
        petPickerView.dataSource = self
//        livingAreaPickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func addNumbers (a:Double, b:Double) -> Double {
       return a+b
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //hardwoodPercent.resignFirstResponder()
        //woodenFloorPercent.resignFirstResponder()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return petArray[row]
    }
    
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
//        return ""//pickerDataSource[component][row]
//    }
    
    func returnVacuumType(hardwood:Double, carpet:Double, pet:Bool, livingSpace:String) -> String {
        //vacuumType = ""
        //var type = String()
        var total = hardwood + carpet
        
        if pet == true {
            
            total += 20
        }
        if livingSpace == "Small" {
            total += 10
        } else if livingSpace == "Medium"{
            total += 30
        } else if livingSpace == "Large"{
            total += 50
        }
        
        if  vacuumType == vacuumType {
            if total < 135 {
                vacuumType = "Small range suggested"
            } else if total > 135 || total < 150 {
                vacuumType = "Mid range suggested"
            } else if total > 150 {
                vacuumType = "Large range suggested"
            }
        }
        return vacuumType!
    }


    @IBAction func submitButtonTap(_ sender: UIButton) {
    
//        let num1 = NSString.init(string: hardwoodPercent.text!).doubleValue
//        print("NUMBER 1 = \(num1)")
//        let num2 = (woodenFloorPercent.description as NSString).doubleValue
        let total = addNumbers(a: NSString.init(string: hardwoodPercent.text!).doubleValue, b: NSString.init(string: woodenFloorPercent.text!).doubleValue)
        
        print("TOTAL =\(total)")
        
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
    }
    
    
    // returns the # of rows in each component..
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     return petArray.count
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
