//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by user on 27/02/2020.
//  Copyright © 2020 Artem Ulko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeObservers()
        tapObservers()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func swipeObservers() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func tapObservers() {
        
        let triplTap = UITapGestureRecognizer(target: self, action: #selector(tripltapAction))
        triplTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(triplTap)
        
        let doublTap = UITapGestureRecognizer(target: self, action: #selector(dowbleAction))
        doublTap.require(toFail: triplTap)
        doublTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doublTap)
        
    }
    
    @objc func tripltapAction() {
        label.text = "tripltapAction"
    }
    
    @objc func dowbleAction() {
        label.text = "dowbleAction"
    }
    
    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        
        switch gester.direction {
        case .right:
            label.text = "right"
        case .left:
            label.text = "left"
        case .up:
            label.text = "up"
        case .down:
            label.text = "down"
        default:
            break
        }
    }


}

