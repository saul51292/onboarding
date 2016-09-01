//
//  CarouselView.swift
//  Onboarding
//
//  Created by Saul on 8/30/16.
//  Copyright © 2016 Saul. All rights reserved.
//

import UIKit

class CarouselView: UIView {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    let placeholderImage = UIImageView(image: UIImage(named: "hook up.png"))
    let hiPlaceholderImage = UIImageView(image: UIImage(named: "hiBig.png"))

    func addUserSpecificCarouselView(carouselView: UIView) {
        topView.addSubview(carouselView)
        carouselView.contentMode = .ScaleAspectFill
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 100.0))
        self.addConstraint(NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: topView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: topView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: topView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0))
        setLineSpacing(topLabel)
        addHiPlaceholder()
    }
    
    func addHiPlaceholder() {
        topView.addSubview(hiPlaceholderImage)
        hiPlaceholderImage.contentMode = .ScaleAspectFill
        hiPlaceholderImage.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: hiPlaceholderImage, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 100.0))
        self.addConstraint(NSLayoutConstraint(item: hiPlaceholderImage, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: topView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -8.0))
        self.addConstraint(NSLayoutConstraint(item: hiPlaceholderImage, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: topView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 10.0))
        self.addConstraint(NSLayoutConstraint(item: hiPlaceholderImage, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: topView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0))
        
    }
    
    func addPlaceholder() {
        self.addSubview(placeholderImage)
        placeholderImage.contentMode = .ScaleAspectFit
        placeholderImage.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: placeholderImage, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: placeholderImage, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: placeholderImage, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0))
        
    }
    
    func addLineCarouselView(carouselView: UIView) {
        topView.addSubview(carouselView)
        carouselView.contentMode = .ScaleAspectFill
        carouselView.layer.allowsEdgeAntialiasing = true
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: topView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: topView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: topView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0))
        setLineSpacing(topLabel)
        
    }
    
    func addCardCarouselView(carouselView: UIView) {
        self.addSubview(carouselView)
        carouselView.contentMode = .ScaleAspectFill
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0))
        addPlaceholder()
    }
    
    func addWhyButton() {
        let whyButton = UIButton()
        whyButton.setTitle("Why?", forState: .Normal)
        whyButton.setTitleColor(UIColor.greenColor(), forState: .Normal)
        bottomView.addSubview(whyButton)
        whyButton.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: whyButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 50.0))
        self.addConstraint(NSLayoutConstraint(item: whyButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 22.0))
        self.addConstraint(NSLayoutConstraint(item: whyButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: topLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 24.0))
        self.addConstraint(NSLayoutConstraint(item: whyButton, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: topLabel, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0))
        
        
    }
    
    func unhideAndSetSubLabel(text: String) {
        nameLabel.hidden = false
        nameLabel.text = text
    }
    
    func removeHiPlaceholder() {
        hiPlaceholderImage.removeFromSuperview()
    }
    
    func removePlaceholder() {
        placeholderImage.removeFromSuperview()
    }
    
    func setLineSpacing(label: UILabel) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2.5
        
        let attrString = NSMutableAttributedString(string: label.text!)
        attrString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        label.attributedText = attrString
    }
    
    func bottomLabelText(text: String) {
        bottomLabel.text = text
    }
    
    func topLabelText(text: String) {
        topLabel.text = text
    }
    
    
    
}
