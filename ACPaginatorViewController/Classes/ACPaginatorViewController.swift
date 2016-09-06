//
//  ACPaginatorViewController.swift
//  Pods
//
//  Created by Alex Corlatti on 16/06/16.
//
//

open class ACPaginatorViewController: UIPageViewController {

    open var paginationDelegate: ACPaginatorViewControllerDelegate?

    open var orderedViewControllers: [UIViewController] = []

    open var currentViewControllerIndex: Int = 0

    override open func viewDidLoad() {

        super.viewDidLoad()

        dataSource = self
        delegate = self

        paginationDelegate?.pageControl?.numberOfPages = orderedViewControllers.count
        paginationDelegate?.paginatorViewController?(self, didUpdatePageCount: orderedViewControllers.count)

        guard orderedViewControllers.count > 0 else { return }

        if currentViewControllerIndex >= orderedViewControllers.count {

            currentViewControllerIndex = orderedViewControllers.count - 1

        } else if currentViewControllerIndex < 0 {

            currentViewControllerIndex = 0

        }

    }

    open override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)

        guard currentViewControllerIndex < orderedViewControllers.count && currentViewControllerIndex >= 0 else  { return }
        
        setViewControllers([orderedViewControllers[currentViewControllerIndex]], direction: .forward, animated: true, completion: nil)
        paginationDelegate?.pageControl?.currentPage = currentViewControllerIndex
        paginationDelegate?.paginatorViewController?(self, didUpdatePageIndex: currentViewControllerIndex)

    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ACPaginatorViewController: UIPageViewControllerDataSource {

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else { return nil }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else { return nil }

        guard orderedViewControllers.count > previousIndex else { return nil }

        currentViewControllerIndex = previousIndex

        return orderedViewControllers[currentViewControllerIndex]

    }

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else { return nil }

        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count

        guard orderedViewControllersCount != nextIndex else { return nil }

        guard orderedViewControllersCount > nextIndex else { return nil }

        currentViewControllerIndex = nextIndex

        return orderedViewControllers[currentViewControllerIndex]

    }

}

extension ACPaginatorViewController: UIPageViewControllerDelegate {

    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        guard let
            firstViewController = viewControllers?.first,
            let index = orderedViewControllers.index(of: firstViewController) else { return }

        paginationDelegate?.pageControl?.currentPage = index
        paginationDelegate?.paginatorViewController?(self, didUpdatePageIndex: index)

    }

}
