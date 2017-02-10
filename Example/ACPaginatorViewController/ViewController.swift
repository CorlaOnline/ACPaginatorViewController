//
//  ViewController.swift
//  ACPaginatorViewController
//
//  Created by Alex Corlatti on 06/16/2016.
//  Copyright (c) 2016 Alex Corlatti. All rights reserved.
//

import UIKit
import ACPaginatorViewController

class ViewController: UIViewController, ACPaginatorViewControllerDelegate {

    @IBOutlet weak var pageControl: UIPageControl?
    @IBOutlet weak var containerView: UIView!
    
    var orderedViewControllers: [UIViewController] = {

        guard let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "First") as UIViewController?,
            let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Second") as UIViewController?,
            let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Third") as UIViewController? else { return [] }

        let firstDoubleVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "First") as! FirstViewController
        
        firstDoubleVC.paginatorIndex = 2
        
        return [firstVC, secondVC, firstDoubleVC, thirdVC]

    }()

    override func viewDidLoad() {

        super.viewDidLoad()
        
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let paginatorViewController = segue.destination as? ACPaginatorViewController {

            paginatorViewController.orderedViewControllers = orderedViewControllers
            paginatorViewController.paginationDelegate = self
            paginatorViewController.currentViewControllerIndex = 1

        }

    }

}

// Optional method
extension ViewController {

    func paginatorViewController(paginatorViewController: ACPaginatorViewController, didUpdatePageCount count: Int) {

        // Do something

    }

    func paginatorViewController(paginatorViewController: ACPaginatorViewController, didUpdatePageIndex index: Int) {

        // Do something

    }

}
