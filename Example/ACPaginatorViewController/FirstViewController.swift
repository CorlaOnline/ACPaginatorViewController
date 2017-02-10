//
//  FirstViewController.swift
//  ACPaginatorViewController
//
//  Created by Alex Corlatti on 10/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import ACPaginatorViewController

class FirstViewController: UIViewController, ACPaginatorProtocol {
    
    public var paginatorIndex: Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
