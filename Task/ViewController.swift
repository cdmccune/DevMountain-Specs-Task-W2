//
//  ViewController.swift
//  Task
//
//  Created by Curt McCune on 5/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        button.setBackgroundImage(UIImage(named: "complete"), for: .normal)
//
        if #available(iOS 15.0, *) {
           
            
            button.setImage(UIImage(named: "complete"), for: .normal)
            var config = UIButton.Configuration.filled()
            config.imagePadding = 40
            button.configuration = config
        } else {
           
        }
//        button.setImage(UIImage(named: "complete"), for: .normal)
        
//
    }
    

    

}
