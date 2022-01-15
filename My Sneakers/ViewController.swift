//
//  ViewController.swift
//  My Sneakers
//
//  Created by Youssef Bhl on 13/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var nameT: UITextField!
    @IBOutlet weak var sneakerImg: UIImageView!
    @IBOutlet weak var pointureLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    
    
    var name: String = ""
    var categories: String = "city"
    var categoriesFR: String = "ville"
    var gender: String = "boy"
    let colors = ["white", "red", "green", "blue", "black"]
    let colorsFR = ["Blanc", "Rouge", "Vert", "Bleu", "Noir"]
    var color: String = "white"
    var colorFR: String = "Blanc"
    var pointure: Int = 36
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.delegate = self
        colorPicker.dataSource = self
        nameT.delegate = self
        dataUpdate()
    }
    
    func dataUpdate() {
        sneakerImg.image = UIImage(named: "\(gender)_\(categories)_\(color)")
        print("\(gender)_\(categories)_\(color)")
        
        infoLbl.text = "\(name)!, J'ai trouvé pour vous cette chaussure de \(categories) en \(colorFR) de pointure \(pointure) !"
    }
    
    @IBAction func categorysSeg(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            categories = "city"
            categoriesFR = "ville"
        } else if sender.selectedSegmentIndex == 1 {
            categories = "running"
            categoriesFR = "Running"
        } else if sender.selectedSegmentIndex == 2 {
            categories = "basket"
            categoriesFR = "BasketBall"
        } else {
            print("Cartegorie error")
        }
        dataUpdate()
        print("\(gender)_\(categories)_\(color)")
    }
    
    @IBAction func genderSwitch(_ sender: UISwitch) {
        gender = "boy"
        gender = (sender.isOn ? "boy" : "girl")
        dataUpdate()
        print("\(gender)_\(categories)_\(color)")
    }
    
    @IBAction func pointureStepper(_ sender: UIStepper) {
        pointure = Int(sender.value)
        pointureLbl.text = "Pointure: \(pointure)"
        dataUpdate()
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        color = colors[row]
        colorFR = colorsFR[row]
        dataUpdate()
        print("\(gender)_\(categories)_\(color)")
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = colorsFR[row]
        return title
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
