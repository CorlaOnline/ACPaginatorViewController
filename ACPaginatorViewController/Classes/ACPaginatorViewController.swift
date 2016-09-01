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
    
    public var startViewControllerIndex: Int = 0

    override public func viewDidLoad() {

        super.viewDidLoad()

        dataSource = self
        delegate = self
        
        paginationDelegate?.pageControl?.numberOfPages = orderedViewControllers.count
        paginationDelegate?.paginatorViewController?(self, didUpdatePageCount: orderedViewControllers.count)

        guard orderedViewControllers.count > 0 else { return }
        
        if startViewControllerIndex >= orderedViewControllers.count {
            
            startViewControllerIndex = orderedViewControllers.endIndex
            
        } else if startViewControllerIndex < 0  {
        
            startViewControllerIndex = 0
        
        }
        
        setViewControllers([orderedViewControllers[startViewControllerIndex]], direction: .Forward, animated: true, completion: nil)
        paginationDelegate?.pageControl?.currentPage = startViewControllerIndex
        paginationDelegate?.paginatorViewController?(self, didUpdatePageIndex: startViewControllerIndex)
        
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

        guard let
            firstViewController = viewControllers?.first,
            index = orderedViewControllers.indexOf(firstViewController) else { return }

        paginationDelegate?.pageControl?.currentPage = index
        paginationDelegate?.paginatorViewController?(self, didUpdatePageIndex: index)

    }

}
