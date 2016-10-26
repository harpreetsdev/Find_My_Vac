//
//  InputViewController.swift
//  Find My Vac
//
//  Created by HARPREET SINGH on 10/9/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var backgroundImgView: UIImageView!
    @IBOutlet weak var searchPageLabel: UILabel!
    @IBOutlet weak var hardwoodFloorPickerView: UIPickerView!
    @IBOutlet weak var carpetPickerView: UIPickerView!
    @IBOutlet weak var livingAreaSizePickerView: UIPickerView!
    //@IBOutlet weak var petPickerView: UIPickerView!
    @IBOutlet weak var petTextField: UITextField!
    @IBOutlet weak var livingAreaTextField: UITextField!
    @IBOutlet weak var livingAreaPickerView: UIPickerView!
    @IBOutlet weak var petPickerView: UIPickerView!
    @IBOutlet weak var hardwoodPercent: UITextField!
    @IBOutlet weak var woodenFloorPercent: UITextField!
    var vacuumType:String?
    var petArray = ["Yes","No"]
    var livingSpaceArray = ["Small","Medium","Large"]
    var total : Double = 0.0 
    @IBOutlet weak var submitButton: UIButton!
    var pet:String?
    var finalString:String?
    var woodFloorPercentArray:[Int]=[]
    var carpetPercentArray:[Int]=[]
    
    
    override func viewDidLoad() {
    
    super.viewDidLoad()
    setUpOutlets()
    }
    
    func setUpOutlets() {
        
        hardwoodFloorPickerView.delegate = self
        hardwoodFloorPickerView.dataSource = self
        
        carpetPickerView.delegate = self
        carpetPickerView.dataSource = self
        
        petPickerView.delegate = self
        petPickerView.dataSource = self
        
        livingAreaSizePickerView.delegate = self
        livingAreaSizePickerView.dataSource = self
        
        carpetPickerView.backgroundColor = UIColor.red
        woodFloorPercentArray = createPercentArray()
        carpetPercentArray = createPercentArray()
        self.carpetPickerView.backgroundColor = UIColor(red: 62, green: 237, blue: 255, alpha: 1)
        carpetPickerView.layer.cornerRadius = 8
        carpetPickerView.clipsToBounds = true
        carpetPickerView.showsSelectionIndicator = true
        searchPageLabel.layer.cornerRadius = 8
        searchPageLabel.clipsToBounds = true
        
        submitButton.backgroundColor = UIColor.clear
        submitButton.layer.cornerRadius = 8
        submitButton.clipsToBounds = true
        submitButton.setBackgroundImage(UIImage(named:"BackgroundImage1"), for: UIControlState.normal)
        
    }
    
    //Mark: Helper methods.
    func createPercentArray()->[Int]{
        var resultArray:[Int]=[]
        
        for i:Int in 0..<101 {
        resultArray.append(i)
        }
        return resultArray
    }
    
    func calculateTotal(woodenPercent:Int, carpetPercent:Int, pet:Int, livingAreaSpace:Int)->String{
        
        var total:Int=0
        total = woodenPercent+carpetPercent
        if pet==0 {
            total += 30
        }
        if livingAreaSpace==1 {
            total += 25
        }
        else if livingAreaSpace==2 {
            total += 55
        }
        print(total)

        var returnString:String = ""
        
        switch total {
        case (0...120):
            returnString = "SmallRange"
        case (121...145):
            returnString = "MediumRange"
        case (146...200):
            returnString = "LargeRange"
   
        default:
            return ""
        }
        
        return returnString
    }

//    func returnVacuumType(hardwood:Double, carpet:Double, pet:String, livingSpace:String) -> String {
//        if total == total {
//            total = hardwood + carpet}
//        
//        //self.pet = pet
//        if petTextField.text! == "yes" {
//            total += 20.0
//        }
//        if livingAreaTextField.text! == "Small" {
//            total += 10
//        } else if livingAreaTextField.text! == "Medium"{
//            total += 30
//        } else if livingAreaTextField.text! == "Large"{
//            total += 70
//        }
//        if  vacuumType == vacuumType {
//            if total < 135 {
//                vacuumType = "Cheap ass vacuum range suggested you broke bastard"
//            } else if total > 135 || total < 150 {
//                vacuumType = "Mid range suggested, go for it."
//            } else if total > 150 {
//                vacuumType = "Large range suggested, you lucky bastard"
//            }
//        }
//        
//        return vacuumType!
//    }
//
    func addNumbers (a:Double, b:Double) -> Double {
       return a+b
    }
    
    @IBAction func submitButtonTap(_ sender: UIButton) {
    // print(hardwoodFloorPickerView.selectedRow(inComponent: 0))
    
    let returnedString = calculateTotal(woodenPercent: hardwoodFloorPickerView.selectedRow(inComponent: 0), carpetPercent: carpetPickerView.selectedRow(inComponent: 0), pet: petPickerView.selectedRow(inComponent: 0), livingAreaSpace: livingAreaSizePickerView.selectedRow(inComponent: 0))
        
    print(returnedString)
        
    }
    
    //Mark: Picker view delegate and datasource methods.
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        switch pickerView.tag
        {
        case 1:
            return createPercentArray().count
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
        
        switch pickerView.tag
        {
        case 1:
            return createPercentArray()[row].description
        case 2:
            return createPercentArray()[row].description
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
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
        let label = UILabel()
        var data = Int()
        switch pickerView.tag {
        case 1:
            let title = NSAttributedString(string: createPercentArray()[row].description, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightBold)])
            label.attributedText = title
            label.textAlignment = NSTextAlignment.center
            return label
        case 2:
            let title = NSAttributedString(string: createPercentArray()[row].description, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightBold)])
            label.attributedText = title
            label.textAlignment = NSTextAlignment.center
            return label
        case 3:
            let title = NSAttributedString(string: petArray[row], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightBold)])
            label.attributedText = title
            label.textAlignment = NSTextAlignment.center
            return label

        case 4:
            let title = NSAttributedString(string: livingSpaceArray[row], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightBold)])
            label.attributedText = title
            label.textAlignment = NSTextAlignment.center
            return label

        default:
            data = 0
        }
        
        return label

    }
    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 15
    }
    
    public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 150
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        // print(carpetPercentArray[row].description)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "SegueToDetailVC" {
            
            if let destinationVC = segue.destination as? ResultViewController {
                
                //let num1 = NSString.init(string: hardwoodPercent.text!).doubleValue
           
              //let num2 = NSString.init(string: woodenFloorPercent.text!).doubleValue
              //let  finalString = returnVacuumType(hardwood:num2, carpet:num1,pet:petTextField.text!,livingSpace:livingAreaTextField.text!)
              //destinationVC.numberLabel.text = total.description
              //destinationVC.textLabel.text = finalString
                //self.prepare(for: <#T##UIStoryboardSegue#>, sender: <#T##Any?#>)
                //print(finalString)
                //print("TOTAL =\(total)")
                
            
                 //
                 //
                
            }

          }
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //hardwoodPercent.resignFirstResponder()
        //woodenFloorPercent.resignFirstResponder()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    }
  

