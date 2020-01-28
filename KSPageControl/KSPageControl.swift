//
//  KSPageControl.swift
//  KSPageControl
//
//  Created by 박기석 on 2020/01/28.
//  Copyright © 2020 Peter. All rights reserved.
//

import UIKit

open class KSPageControl: UIPageControl {
    
    open var pageIndicatorImage: UIImage? = nil
    open var currentPageIndicatorImage: UIImage? = nil
    
    override open var numberOfPages: Int {
        didSet {
            guard let _ = pageIndicatorImage else { return }
            pageIndicatorTintColor = .clear
            self.updateDotsImage()
        }
    }
    
    override open var currentPage: Int {
        didSet {
            guard let _ = currentPageIndicatorImage else { return }
            currentPageIndicatorTintColor = .clear
            self.updateDotsImage()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.clipsToBounds = false
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateDotsImage() {
        for (index, view) in self.subviews.enumerated() {
            let image = index == currentPage ? currentPageIndicatorImage : pageIndicatorImage
            if let imageView = view as? UIImageView {
                imageView.image = image
            } else {
                view.addSubview(UIImageView(image: image))
            }
        }
    }
}
