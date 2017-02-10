//
//  SecondViewController.swift
//  ACPaginatorViewController
//
//  Created by Alex Corlatti on 10/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import ACPaginatorViewController

class SecondViewController: UIViewController, ACPaginatorProtocol {
    
    public var paginatorIndex: Int = 1

    override func viewDidLoad() {
        
        super.viewDidLoad()

        paginatorIndex = 1
        
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
