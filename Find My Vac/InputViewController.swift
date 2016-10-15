//
//  InputViewController.swift
//  Find My Vac
//
//  Created by HARPREET SINGH on 10/9/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var carpetPickerView: UIPickerView!
    @IBOutlet weak var livingAreaSizePickerView: UIPickerView!
    //@IBOutlet weak var petPickerView: UIPickerView!
    @IBOutlet weak var hardwoodPickerView: UIPickerView!
    @IBOutlet weak var petTextField: UITextField!
    @IBOutlet weak var livingAreaTextField: UITextField!
    @IBOutlet weak var livingAreaPickerView: UIPickerView!
    @IBOutlet weak var petPickerView: UIPickerView!
    @IBOutlet weak var hardwoodPercent: UITextField!
    @IBOutlet weak var woodenFloorPercent: UITextField!
    var vacuumType:String?
    var petArray = ["YES","NO"]
    var livingSpaceArray = ["Small","Medium","Large"]
    var total : Double = 0.0 
    @IBOutlet weak var submitButton: UIButton!
    var pet:String?
    var finalString:String?
    var woodFloorPercentArray:[Int]=[]
    var carpetPercentArray:[Int]=[]
    override func viewDidLoad() {
    
        super.viewDidLoad()
        carpetPickerView.delegate = self
        carpetPickerView.dataSource = self
        hardwoodPickerView.dataSource = self
        hardwoodPickerView.dataSource = self
        petPickerView.delegate = self
        petPickerView.dataSource = self
        livingAreaSizePickerView.delegate = self
        livingAreaSizePickerView.dataSource = self
        
        //hardwoodPercent.delegate = self
        //woodenFloorPercent.delegate = self
        //petPickerView.delegate = self
        //livingAreaPickerView.delegate = self
        //petPickerView.dataSource = self
//        livingAreaPickerView.dataSource = self
        // Do any additional setup after loading the view.
        
        //view.backgroundColor = UIColor(red: 32, green: 125, blue: 140, alpha: 1)
        setUpOutlets()
        
    }
    
    func setUpOutlets() {
    woodFloorPercentArray = createPercentArrays()
    carpetPercentArray = createPercentArrays()
    }
    
    func createPercentArrays() -> [Int]{
        var resultArray:[Int]=[]
        
        for i:Int in 0..<101 {
        resultArray.append(i)
        }
        return resultArray
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        switch pickerView.tag {
        case 1:
            return woodFloorPercentArray.count
        case 2:
            return carpetPercentArray.count
        case 3:
             return petArray.count
        case 4:
             return livingSpaceArray.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return woodFloorPercentArray[row].description
        case 2:
            return carpetPercentArray[row].description
        case 3:
            return petArray[row]
        case 4:
            return livingSpaceArray[row]

        default:
            return "NOTHING"
        }
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // returns the # of rows in each component..
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return woodFloorPercentArray.count
        case 2:
            return carpetPercentArray.count
        case 3:
            return petArray.count
        case 4:
            return livingSpaceArray.count

        default:
            return 0
        }
        
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
  

