//
//  ACPaginatorViewController.swift
//  Pods
//
//  Created by Alex Corlatti on 16/06/16.
//
//

public class ACPaginatorViewController: UIPageViewController {

    public var paginationDelegate: ACPaginatorViewControllerDelegate?

    public var orderedViewControllers: [UIViewController] = []

    override public func viewDidLoad() {

        super.viewDidLoad()

        dataSource = self
        delegate = self

        if let firstViewController = orderedViewControllers.first {

            setViewControllers([firstViewController], direction: .Forward, animated: true, completion: nil)

        }

        paginationDelegate?.pageControl?.numberOfPages = orderedViewControllers.count
        paginationDelegate?.paginatorViewController?(self, didUpdatePageCount: orderedViewControllers.count)

    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ACPaginatorViewController: UIPageViewControllerDataSource {

    public func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else { return nil }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else { return nil }

        guard orderedViewControllers.count > previousIndex else { return nil }

        return orderedViewControllers[previousIndex]

    }

    public func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else { return nil }

        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count

        guard orderedViewControllersCount != nextIndex else { return nil }

        guard orderedViewControllersCount > nextIndex else { return nil }

        return orderedViewControllers[nextIndex]

    }

}

extension ACPaginatorViewController: UIPageViewControllerDelegate {

    public func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.indexOf(firstViewController) {

            paginationDelegate?.pageControl?.currentPage = index
            paginationDelegate?.paginatorViewController?(self, didUpdatePageIndex: index)

        }
    }

}
