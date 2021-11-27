//
//  SettingsViewController.swift
//  Prework
//
//  Created by Emma Jin on 11/22/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //
    @IBAction func setDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        let defaultInd = defaultTipControl.selectedSegmentIndex
        defaults.set(defaultInd, forKey: "DefaultTipIndex")
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
