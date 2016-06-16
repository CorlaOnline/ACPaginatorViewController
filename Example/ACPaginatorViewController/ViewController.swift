//
//  ViewController.swift
//  ACPaginatorViewController
//
//  Created by Alex Corlatti on 06/16/2016.
//  Copyright (c) 2016 Alex Corlatti. All rights reserved.
//

import UIKit
import ACPaginatorViewController

class ViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl?
    @IBOutlet weak var containerView: UIView!

    private(set) lazy var orderedViewControllers: [UIViewController] = {
    
        guard let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("First") as UIViewController? else { return [] }
        
        guard let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Second") as UIViewController? else { return [] }
    
        return [firstVC, secondVC]
        
    }()

    override func viewDidLoad() {

        super.viewDidLoad()

    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if let paginatorViewController = segue.destinationViewController as? ACPaginatorViewController {

            paginatorViewController.orderedViewControllers = orderedViewControllers
            paginatorViewController.paginationDelegate = self

        }

    }

}

extension ViewController: ACPaginatorViewControllerDelegate {

    func paginatorViewController(paginatorViewController: ACPaginatorViewController, didUpdatePageCount count: Int) {

        pageControl?.numberOfPages = count

    }

    func paginatorViewController(paginatorViewController: ACPaginatorViewController, didUpdatePageIndex index: Int) {

        pageControl?.currentPage = index

    }

}
