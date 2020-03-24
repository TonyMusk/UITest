//
//  QuizViewController.swift
//  UITest
//
//  Created by Studium  on 23.03.20.
//  Copyright © 2020 Studium. All rights reserved.
//

import UIKit
import SpriteKit

class HomeController: UIViewController {
    
    var delegate: HomeControllerDelegate?
    
    
    
    @IBOutlet weak var diff: UILabel!
    var selectedDificulty: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        
        diff.text = selectedDificulty
        
        print("QuizView")
        print("Sender description: \(selectedDificulty)")
    }
    
    @objc func handleMenuToggle(){
        
        delegate?.handleMenuToggle()
        
    }
    
    func configureNavigationBar(){
        
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: menu, style: .plain, target: self, action: #selector(handleMenuToggle))
        
    }
    
    
    @IBAction func answerSelected(_ sender: UIButton) {
        print("Button \(sender.tag) pressed!")
    }
    
}

