//
//  ViewController.swift
//  Prework
//
//  Created by Emma Jin on 11/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tipOne = defaults.string(forKey: "tipOneValue") ?? "15"
        let tipTwo = defaults.string(forKey: "tipTwoValue") ?? "18"
        let tipThree = defaults.string(forKey: "tipThreeValue") ?? "20"
        print(tipOne, tipTwo, tipThree)
        tipControl.setTitle(tipOne + "%", forSegmentAt: 0)
        tipControl.setTitle(tipTwo + "%", forSegmentAt: 1)
        tipControl.setTitle(tipThree + "%", forSegmentAt: 2)
        
        let newInd = defaults.integer(forKey: "DefaultTipIndex")
        tipControl.selectedSegmentIndex = newInd
        calculateTip(super.viewWillAppear(animated))
        
    }

    @IBAction func animateBill(_ sender: Any) {
        billAmountTextField.shake()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        print("in calculate")
        let bill = Double(billAmountTextField.text!) ?? 0
        var tipOne = tipControl.titleForSegment(at: 0) ?? "15"
        tipOne.removeLast()
        let tipOneVal = (Double(tipOne) ?? 15.0) * 0.01
        var tipTwo = tipControl.titleForSegment(at: 1) ?? "18"
        tipTwo.removeLast()
        let tipTwoVal = (Double(tipTwo) ?? 18.0) * 0.01
        var tipThree = tipControl.titleForSegment(at: 2) ?? "20"
        tipThree.removeLast()
        let tipThreeVal = (Double(tipThree) ?? 20.0) * 0.01
        let tipPercentages = [tipOneVal, tipTwoVal, tipThreeVal]
        print(tipPercentages)
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

extension UITextField {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}
