//
//  launchViewController.swift
//  musicPlayer
//
//  Created by Ajay Sharma on 29/04/21.
//  Copyright © 2021 Ajay Sharma. All rights reserved.
//

import UIKit

class launchViewController: UIViewController {

  

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var browsePressed: UIButton!
    override func viewDidLoad() {
          super.viewDidLoad()
          
          textLabel.text = ""
          var charIndex = 0.0
        let textText = "browse for the songs u like:)"
          for letter in textText {
              Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                  self.textLabel.text?.append(letter)
              }
             charIndex += 1
          }
        
        
      }
    
    @IBAction func browsePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToBrowser", sender: self)
          }
    }
   
      
      

  


