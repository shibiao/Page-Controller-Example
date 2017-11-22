//
//  MyPageController.swift
//  Page Controller Example
//
//  Created by Wallace Wang on 1/22/17.
//  Copyright © 2017 Wallace Wang. All rights reserved.
//

import Cocoa

class MyPageController: NSPageController, NSPageControllerDelegate {
    
    var myViewArray = ["one", "two", "three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        delegate = self
        self.arrangedObjects = myViewArray
        self.transitionStyle = .stackBook
    }
    
    func pageController(_ pageController: NSPageController, viewControllerForIdentifier identifier: String) -> NSViewController {
        
        switch identifier {
        case "one":
            return NSStoryboard(name: "Main", bundle:nil).instantiateController(withIdentifier: "Page01") as! NSViewController
        case "two":
            return NSStoryboard(name: "Main", bundle:nil).instantiateController(withIdentifier: "Page02") as! NSViewController
        case "three":
            return NSStoryboard(name: "Main", bundle:nil).instantiateController(withIdentifier: "Page03") as! NSViewController
        default:
            return self.storyboard?.instantiateController(withIdentifier: identifier) as! NSViewController
        }
    }
    
    func pageController(_ pageController: NSPageController, identifierFor object: Any) -> String {
        print("___",object)
        return String(describing: object)
        
    }
    
    func pageControllerDidEndLiveTransition(_ pageController: NSPageController) {
        self.completeTransition()
    }
    
}
