//
//  TempleCardView.swift
//  TempleFlashcards
//
//  Created by Kyle Gill on 10/11/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import UIKit

@IBDesignable
class TempleCardView : UIView {

    // MARK: - Properties
    var card = TempleCard()
    
    // MARK: - Computed Properties
    var cornerRadius: CGFloat { return bounds.width * 0.05 }
    
    // MARK: - Helpers
    private func popContext() {
        UIGraphicsGetCurrentContext()?.restoreGState()
    }
    
    private func pushContext() -> CGContext? {
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        return context
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor.clear
        isOpaque = false
    }
    
    // MARK: - Drawing
    override func draw(_ rect: CGRect) {
        drawBaseCard()
    }
    
    private func drawBaseCard() {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        roundedRect.addClip()
        _ = pushContext()
        UIColor.white.setFill()
        UIRectFill(bounds)
        popContext()
    }
}
