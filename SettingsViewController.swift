//
//  SettingsViewController.swift
//  Prework
//
//  Created by Emma Jin on 11/22/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipOneValue: UITextField!
    @IBOutlet weak var tipTwoValue: UITextField!
    @IBOutlet weak var tipThreeValue: UITextField!
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let oldTipOne = defaults.string(forKey: "tipOneValue") ?? "15"
        let oldTipTwo = defaults.string(forKey: "tipTwoValue") ?? "18"
        let oldTipThree = defaults.string(forKey: "tipThreeValue") ?? "20"
        tipOneValue.text = oldTipOne
        tipTwoValue.text = oldTipTwo
        tipThreeValue.text = oldTipThree
        defaultTipControl.setTitle(oldTipOne + "%", forSegmentAt: 0)
        defaultTipControl.setTitle(oldTipTwo + "%", forSegmentAt: 1)
        defaultTipControl.setTitle(oldTipThree + "%", forSegmentAt: 2)
        
        defaults.synchronize()
        
    }
    //
    @IBAction func setDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        let defaultInd = defaultTipControl.selectedSegmentIndex
        defaults.set(defaultInd, forKey: "DefaultTipIndex")
        defaults.synchronize()
    }


    @IBAction func setTipOne(_ sender: Any) {
        let defaults = UserDefaults.standard
        let newValue = tipOneValue.text
        defaults.set(newValue, forKey: "tipOneValue")
        defaults.synchronize()
    }
    

    @IBAction func setTipTwo(_ sender: Any) {
        let defaults = UserDefaults.standard
        let newValue = tipTwoValue.text
        defaults.set(newValue, forKey: "tipTwoValue")
        defaults.synchronize()
    }
    
    @IBAction func setTipThree(_ sender: Any) {
        let defaults = UserDefaults.standard
        let newValue = tipThreeValue.text
        defaults.set(newValue, forKey: "tipThreeValue")
        defaults.synchronize()
    }
    
    
    /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
