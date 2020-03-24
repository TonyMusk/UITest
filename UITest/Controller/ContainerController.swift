//
//  ContainerController.swift
//  UITest
//
//  Created by Studium  on 24.03.20.
//  Copyright © 2020 Studium. All rights reserved.
//

import UIKit

class ContainerController: UIViewController{
    
    //MARK: - Properties
    
    var menuController: UIViewController!
    var centerController: UIViewController!
    var isExpanded = false
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return.lightContent
        
    }
    
    //MARK : Handlers
    
    func configureHomeController() {
        
        let homeController = HomeController()
        HomeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
        
        
    }
    
    func configureMenuController(){
        
        if menuController == nil{
            
            menuController = MenuController()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Did add menu controller")
            
        }
        
        
    }
    
    func showMenuController(shouldExpand: Bool) {
        
        if shouldExpand{
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
                
            }, completion: nil)
        } else {
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.centerController.view.frame.origin.x = 0
                
            }, completion: nil)
            
        }
        
        
    }
    
    
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle() {
        <#code#>
    }
    
    
    func handleMenuToogle (){
        
        if !isExpanded{
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded)
        
    }
    
}
