//
//  InputViewController.swift
//  Find My Vac
//
//  Created by HARPREET SINGH on 10/9/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var livingAreaSizePickerView: UIPickerView!
    //@IBOutlet weak var petPickerView: UIPickerView!
    @IBOutlet weak var woodenFloorPickerView: UIPickerView!
    @IBOutlet weak var hardwoodPickerView: UIPickerView!
    @IBOutlet weak var petTextField: UITextField!
    @IBOutlet weak var livingAreaTextField: UITextField!
    @IBOutlet weak var livingAreaPickerView: UIPickerView!
    @IBOutlet weak var petPickerView: UIPickerView!
    @IBOutlet weak var hardwoodPercent: UITextField!
    @IBOutlet weak var woodenFloorPercent: UITextField!
    var vacuumType:String?
    var petArray = ["YES","NO"]
    var total : Double = 0.0 
    @IBOutlet weak var submitButton: UIButton!
    var pet:String?
    var finalString:String?
    override func viewDidLoad() {
    
        super.viewDidLoad()
        hardwoodPercent.delegate = self
        woodenFloorPercent.delegate = self
        petPickerView.delegate = self
        //livingAreaPickerView.delegate = self
        petPickerView.dataSource = self
//        livingAreaPickerView.dataSource = self
        // Do any additional setup after loading the view.
        
        //view.backgroundColor = UIColor(red: 32, green: 125, blue: 140, alpha: 1)
        
    }
    
//    var pet : Bool {
//        set{
//         self.pet = false
//        }
//        get{
//            if petPickerView.isEqual("YES") {
//            //self.pet = true
//            }
//        return true
//        }
//    }
//    
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
    
     func returnVacuumType(hardwood:Double, carpet:Double, pet:String, livingSpace:String) -> String {
        if total == total {
            total = hardwood + carpet}
        //vacuumType = ""
        //var type = String()
//        if petPickerView.isEqual("YES") {
//         total! += 20.0
//            
//        }
//
        //self.pet = pet
        if petTextField.text! == "yes" {
          total += 20.0
        }
        if livingAreaTextField.text! == "Small" {
            total += 10
        } else if livingAreaTextField.text! == "Medium"{
            total += 30
        } else if livingAreaTextField.text! == "Large"{
            total += 70
        }
        
        if  vacuumType == vacuumType {
            if total < 135 {
                vacuumType = "Cheap ass vacuum range suggested you broke bastard"
            } else if total > 135 || total < 150 {
                vacuumType = "Mid range suggested, go for it."
            } else if total > 150 {
                vacuumType = "Large range suggested, you lucky bastard"
            }
        }
    
        return vacuumType!
    }


    @IBAction func submitButtonTap(_ sender: UIButton) {
    
//        let num1 = NSString.init(string: hardwoodPercent.text!).doubleValue
//        //        print("NUMBER 1 = \(num1)")
//        let num2 = NSString.init(string: woodenFloorPercent.text!).doubleValue
//        //let total = addNumbers(a: NSString.init(string: hardwoodPercent.text!).doubleValue, b: NSString.init(string: woodenFloorPercent.text!).doubleValue)
//        
//        if  finalString == finalString {
//            finalString = returnVacuumType(hardwood:num2, carpet:num1,pet:petTextField.text!,livingSpace:livingAreaTextField.text!)
//            
//            //self.prepare(for: <#T##UIStoryboardSegue#>, sender: <#T##Any?#>)
//            print(finalString)
//            print("TOTAL =\(total)")
//        }
//
        
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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "SegueToDetailVC" {
            
            if let destinationVC = segue.destination as? ResultViewController {
                
                let num1 = NSString.init(string: hardwoodPercent.text!).doubleValue
           
              let num2 = NSString.init(string: woodenFloorPercent.text!).doubleValue
              let  finalString = returnVacuumType(hardwood:num2, carpet:num1,pet:petTextField.text!,livingSpace:livingAreaTextField.text!)
              //destinationVC.numberLabel.text = total.description
              //destinationVC.textLabel.text = finalString
                //self.prepare(for: <#T##UIStoryboardSegue#>, sender: <#T##Any?#>)
                print(finalString)
                print("TOTAL =\(total)")
                
            
                 //
                 //
                
            }

        }
        }
    
    }
  

