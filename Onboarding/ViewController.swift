//  Copyright © 2016 Saul. All rights reserved.
//

import UIKit

private let kNumberOfScreens: Int = 5
private let kMarginForAlpha: CGFloat = 150.0

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var frame = CGRectMake(0, 0, 0, 0)
    
    // Adding in CarouselViews
    var carouselViewOne = Carousel1AnimationView()
    var carouselViewTwo = Carousel2ForwardView()
    var carouselViewThree = CarouselCardsView()
    var carouselViewThreeFade = Carousel3View()
    var carouselViewFour = Carousel4AnimationView()
    var carouselViewFive = Carousel5AnimationView()
    
    // Flags to make sure user is on specific screen
    var onScreenTwo = false
    var onScreenThree = false
    var onScreenFour = false
    var onScreenFive = false
    
    // Stock Images
    let stockImageView = UIImageView(image: UIImage(named: "stock_1.jpg"))
    let secondStockImageView = UIImageView(image: UIImage(named: "stock_2.jpg"))
    let thirdStockImageView = UIImageView(image: UIImage(named: "stock_3.jpg"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set scrollView
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.directionalLockEnabled = true
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        
        for index in 0...kNumberOfScreens {
            
            frame.origin.x = self.view.frame.size.width * CGFloat(index)
            frame.size = self.view.frame.size
            
            if let nib = instanceFromNib() as? CarouselView {
                self.scrollView.addSubview(nib)
                nib.frame.origin.x = self.view.frame.size.width * CGFloat(index)
                switch(index) {
                case 0:
                    carouselViewOne.hidden = true
                    nib.addUserSpecificCarouselView(carouselViewOne)
                    nib.topLabelText("Welcome to the brand new Hinge.")
                    nib.unhideAndSetSubLabel("Jean Marie,")
                case 1:
                    carouselViewTwo.hidden = true
                    nib.addLineCarouselView(carouselViewTwo)
                    addImageView(stockImageView)
                    nib.topLabelText("We built this for you, and for everyone who's over the games:")
                case 2:
                    carouselViewThree.hidden = true
                    nib.addCardCarouselView(carouselViewThree)
                    
                    carouselViewThreeFade.hidden = true
                    nib.addLineCarouselView(carouselViewThreeFade)
                    addImageView(secondStockImageView)
                    nib.topLabelText("If you're ready to be treated like a person, not a playing card.")
                case 3:
                    carouselViewFour.hidden = true
                    nib.addLineCarouselView(carouselViewFour)
                    addImageView(thirdStockImageView)

                    nib.topLabelText("And ready to find what you're looking for.")
                    nib.bottomLabelText("We got you.")
                    nib.setLineSpacing(nib.bottomLabel)
                case 4:
                    carouselViewFive.hidden = true
                    nib.addLineCarouselView(carouselViewFive)
                    nib.topLabelText("Hinge is a $7/mo members-only \nexperience.")
                    nib.unhideAndSetSubLabel("The Relationship App")
                    nib.addWhyButton()
                default:
                    break

                }
            }
        }
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * CGFloat(kNumberOfScreens), self.view.frame.size.height)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let screenWidth = UIScreen.mainScreen().bounds.width
        
        // makes sure user can't scroll backwards
        if scrollView.contentOffset.x <= 0.0 {
            scrollView.setContentOffset(CGPointMake(0.0, 0.0), animated: false)
        }
        if onScreenTwo && scrollView.contentOffset.x < screenWidth {
            scrollView.setContentOffset(CGPointMake(screenWidth, 0.0), animated: false)
        }
        if onScreenThree && scrollView.contentOffset.x < screenWidth * 2 {
            scrollView.setContentOffset(CGPointMake(screenWidth * 2, 0.0), animated: false)
        }
        if onScreenFour && scrollView.contentOffset.x < screenWidth * 3 {
            scrollView.setContentOffset(CGPointMake(screenWidth * 3, 0.0), animated: false)
        }
        if onScreenFive {
            scrollView.setContentOffset(CGPointMake(screenWidth * 4, 0.0), animated: false)
        }
        
        // controls alpha of image when entering
        switch scrollView.contentOffset.x {
        case (screenWidth - kMarginForAlpha)...screenWidth:
            stockImageView.alpha = (1 + (scrollView.contentOffset.x - screenWidth)/kMarginForAlpha)
        case ((screenWidth * 3) - kMarginForAlpha)...screenWidth * 3:
            thirdStockImageView.alpha = (1 + (scrollView.contentOffset.x - screenWidth * 3)/kMarginForAlpha)
        default:
            break
        }
        
        // controls alpha of image when leaving a screen
        if onScreenTwo && (scrollView.contentOffset.x >= (screenWidth - kMarginForAlpha)) {
            stockImageView.alpha = (1 - (scrollView.contentOffset.x - screenWidth)/kMarginForAlpha)
        }
        if onScreenThree && (scrollView.contentOffset.x >= (screenWidth * 2) - kMarginForAlpha) {
            secondStockImageView.alpha = (1 - (scrollView.contentOffset.x - screenWidth * 2)/kMarginForAlpha)
        }
        if onScreenFour && (scrollView.contentOffset.x >= (screenWidth * 3) - kMarginForAlpha) {
            thirdStockImageView.alpha = (1 - (scrollView.contentOffset.x - screenWidth * 3)/kMarginForAlpha)
        }
        
        switch scrollView.contentOffset.x {
        case screenWidth:
            if !checkIfOnScreen(Int(screenWidth/screenWidth)) {
                scrollView.scrollEnabled = false
                carouselViewTwo.addCarousel2ForwardAnimation({ (_) in
                    scrollView.scrollEnabled = true
                    self.onScreenTwo = true
                })
            }
        case screenWidth * 2:
            self.performSelector(#selector(ViewController.animateImageViewIn), withObject: nil, afterDelay: 7.42)
            if !checkIfOnScreen(Int((screenWidth * 2)/screenWidth)) {
                if let carouselView = carouselViewThree.superview as? CarouselView {
                    carouselView.removePlaceholder()
                }
                scrollView.scrollEnabled = false
                carouselViewThree.addCarousel3CardsAnimation({ (_) in
                    self.carouselViewThreeFade.hidden = false
                    
                    self.carouselViewThreeFade.addCarousel32Animation({ (_) in
                        scrollView.scrollEnabled = true
                        self.onScreenThree = true
                    })
                })
            }
        case screenWidth * 3:
            if !checkIfOnScreen(Int((screenWidth * 3)/screenWidth)) {
                scrollView.scrollEnabled = false
                carouselViewFour.addCarousel4Animation({ (_) in
                    scrollView.scrollEnabled = true
                    self.onScreenFour = true
                })
            }
        case screenWidth * 4:
            if !checkIfOnScreen(Int((screenWidth * 4)/screenWidth)) {
                scrollView.scrollEnabled = false
                carouselViewFive.addCarousel5Animation({ (_) in
                    scrollView.scrollEnabled = true
                    self.onScreenFive = true
                })
            }
        default:
            break
        
        }
    }

    func checkIfOnScreen(index: Int) -> Bool {
        switch(index) {
        case 1:
            pageControl.currentPage = 1
            carouselViewTwo.hidden = false
            return onScreenTwo
        case 2:
            pageControl.currentPage = 2
            carouselViewThree.hidden = false
            return onScreenThree
        case 3:
            pageControl.currentPage = 3
            carouselViewFour.hidden = false
            return onScreenFour
        case 4:
            pageControl.currentPage = 4
            carouselViewFive.hidden = false
            return onScreenFive
        default:
            return false
        }
    }
    
    func animateImageViewIn() {
        UIView.animateWithDuration(0.2, animations: {
            self.secondStockImageView.alpha = 1.0
        })
    }
    
    func addImageView(stockImageView: UIImageView) {
        stockImageView.contentMode = .ScaleAspectFill
        topView.insertSubview(stockImageView, atIndex: 0)
        stockImageView.alpha = 0.0
        stockImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: stockImageView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: topView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: stockImageView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: topView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 10.0))
        self.view.addConstraint(NSLayoutConstraint(item: stockImageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: topView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: stockImageView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: topView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 10.0))
    }
    
    func instanceFromNib() -> UIView {
        return UINib(nibName: "CarouselView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
    
    func animateHi() {
        carouselViewOne.hidden = false
        if let carouselView = carouselViewOne.superview?.superview?.superview as? CarouselView {
            carouselView.removeHiPlaceholder()
        }
        carouselViewOne.addCarousel1Animation()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.performSelector(#selector(ViewController.animateHi), withObject: nil, afterDelay: 1.38)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
