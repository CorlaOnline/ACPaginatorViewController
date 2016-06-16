//
//  ACPaginatorViewControllerDelegate.swift
//  Pods
//
//  Created by Alex Corlatti on 16/06/16.
//
//

public protocol ACPaginatorViewControllerDelegate {

    /**
     Called when the number of pages is updated.

     - parameter paginatorViewController: the ACPaginatorViewController instance
     - parameter count: the total number of pages.
     */
    func paginatorViewController(paginatorViewController: ACPaginatorViewController, didUpdatePageCount count: Int)

    /**
     Called when the current index is updated.

     - parameter paginatorViewController: the ACPaginatorViewController instance
     - parameter index: the index of the currently visible page.
     */
    func paginatorViewController(paginatorViewController: ACPaginatorViewController, didUpdatePageIndex index: Int)

}
