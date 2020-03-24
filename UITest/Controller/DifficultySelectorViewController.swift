//
//  DifficultySelectorViewController.swift
//  UITest
//
//  Created by Studium  on 24.03.20.
//  Copyright © 2020 Studium. All rights reserved.
//

import UIKit

class DifficultySelectorViewController: UIViewController {

    var difficulty : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is HomeController
        {
            let vc = segue.destination as? HomeController
            vc?.selectedDificulty = difficulty
        }
    }

    @IBAction func easyDifficult(_ sender: Any) {
        difficulty = "Leicht"
    }
    @IBAction func mediumDifficult(_ sender: Any) {
        difficulty = "Mittel"
    }
    @IBAction func hardDifficult(_ sender: Any) {
        difficulty = "Schwer"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
