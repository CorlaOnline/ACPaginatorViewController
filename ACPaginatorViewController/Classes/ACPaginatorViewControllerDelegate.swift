//
//  ACPaginatorViewControllerDelegate.swift
//  Pods
//
//  Created by Alex Corlatti on 16/06/16.
//
//

@objc public protocol ACPaginatorViewControllerDelegate {

    weak var pageControl: UIPageControl? { get set }
    weak var containerView: UIView! { get set }

    var orderedViewControllers: [UIViewController] { get set }

    /**
     Called when the number of pages is updated.

     - parameter paginatorViewController: the ACPaginatorViewController instance
     - parameter count: the total number of pages.
     */
    @objc optional func paginatorViewController(paginatorViewController: ACPaginatorViewController, didUpdatePageCount count: Int)

    /**
     Called when the current index is updated.

     - parameter paginatorViewController: the ACPaginatorViewController instance
     - parameter index: the index of the currently visible page.
     */
    @objc optional func paginatorViewController(paginatorViewController: ACPaginatorViewController, didUpdatePageIndex index: Int)

}
