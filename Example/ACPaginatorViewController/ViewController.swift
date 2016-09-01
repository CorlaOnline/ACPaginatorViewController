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

    lazy var orderedViewControllers: [UIViewController] = {

        guard let
            firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("First") as UIViewController?,
            secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Second") as UIViewController?,
            thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Third") as UIViewController? else { return [] }

        return [firstVC, secondVC, thirdVC]

    }()

    override func viewDidLoad() {

        super.viewDidLoad()

    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if let paginatorViewController = segue.destinationViewController as? ACPaginatorViewController {

            paginatorViewController.orderedViewControllers = orderedViewControllers
            paginatorViewController.paginationDelegate = self
            paginatorViewController.startViewControllerIndex = 1

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
