# ACPaginatorViewController

[![CI Status](http://img.shields.io/travis/Alex Corlatti/ACPaginatorViewController.svg?style=flat)](https://travis-ci.org/Alex Corlatti/ACPaginatorViewController)
[![Version](https://img.shields.io/cocoapods/v/ACPaginatorViewController.svg?style=flat)](http://cocoapods.org/pods/ACPaginatorViewController)
[![License](https://img.shields.io/cocoapods/l/ACPaginatorViewController.svg?style=flat)](http://cocoapods.org/pods/ACPaginatorViewController)
[![Platform](https://img.shields.io/cocoapods/p/ACPaginatorViewController.svg?style=flat)](http://cocoapods.org/pods/ACPaginatorViewController)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ACPaginatorViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ACPaginatorViewController"
```

## Usage

Your viewController must conform the ```ACPaginatorViewControllerDelegate``` so it must to implements these three variables:

```swift 
@IBOutlet weak var pageControl: UIPageControl?
@IBOutlet weak var containerView: UIView!
lazy var orderedViewControllers: [UIViewController] = { 

	guard let 
        firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("First") as UIViewController?,
        secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Second") as UIViewController? else { return [] }
        
    return [firstVC, secondVC]
        
}()
```
In your storyboard connect a ``` UIContainerView``` to your variable ``` containerView ``` and the embedded ``` UIPageViewController ``` must to be a ``` ACPaginatorViewController ```, optionally you can connect a ``` UIPageControl ``` to your ``` pageControl ``` variable.

Return to your viewController file and in the ``` prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)``` method you have to pass to the navigator the ordered array of views and tell it that the view conforms to its protocol. You can also specify from which index start to show the views.

```swift 
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

   if let paginatorViewController = segue.destinationViewController as? ACPaginatorViewController {

       paginatorViewController.orderedViewControllers = orderedViewControllers
       paginatorViewController.paginationDelegate = self
       paginatorViewController.startViewControllerIndex = 0 // By default is 0, so you can set it only if you need to start from a differen index

    }

}
```
Optionally you can implement these two methods to do something when the number of views change or when a page is turned.

```swift 
func paginatorViewController(paginatorViewController: ACPaginatorViewController, didUpdatePageCount count: Int) {

   // Do something

}

func paginatorViewController(paginatorViewController: ACPaginatorViewController, didUpdatePageIndex index: Int) {

   // Do something

}
```

## Author

Alex Corlatti, alex.corlatti@gmail.com

## License

ACPaginatorViewController is available under the MIT license. See the LICENSE file for more info.
