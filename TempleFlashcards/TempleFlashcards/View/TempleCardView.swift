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
    var borderStrokeWidth : CGFloat { return 1.5 }
    var borderMargin : CGFloat { return 4.0 }

    
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
        
        drawCenterImage()
        drawTempleName()
        drawBorderSquare()
    }
    
    private func drawBaseCard() {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        roundedRect.addClip()
        _ = pushContext()
        UIColor.white.setFill()
        UIRectFill(bounds)
        popContext()
    }
    
    private func drawBorderSquare() {
        let square = UIBezierPath()
        let width = bounds.width - 4
        let height = bounds.height - 4
        let borderColor : UIColor = UIColor.yellow
        
        _ = pushContext()
        borderColor.setStroke()
        square.lineWidth = borderStrokeWidth
        square.move(to: CGPoint(x: borderMargin, y: borderMargin))
        square.addLine(to: CGPoint(x: width, y: borderMargin))
        square.addLine(to: CGPoint(x: width, y: height))
        square.addLine(to: CGPoint(x: borderMargin, y: height))
        square.close()
        square.stroke()
        popContext()
    }
    
    private func drawCenterImage() {
        guard let templeImage = UIImage(named: card.filename) else {
            return
        }
        
        let width = bounds.width - (borderMargin * 4)
        let height = bounds.height - (borderMargin * 4)
        let templeImageRect = CGRect(x: borderMargin + 3.0,
                                   y: borderMargin + 3.0,
                                   width: width,
                                   height: height)
        templeImage.draw(in: templeImageRect)
        
    }
    
    private func drawTempleName() {
        if TempleCardsViewController.State.isStudyMode == true {
            return
        }
        
        let square = UIBezierPath()
        let width = bounds.width - (borderMargin * 2)
        let fillColor : UIColor = UIColor.white.withAlphaComponent(0.75)
        
        _ = pushContext()
        fillColor.setFill()
        square.move(to: CGPoint(x: borderMargin, y: 72.0))
        square.addLine(to: CGPoint(x: width, y: 72.0))
        square.addLine(to: CGPoint(x: width, y: 90.0))
        square.addLine(to: CGPoint(x: borderMargin, y: 90.0))
        square.close()
        square.fill()
        let textRectangle = CGRect(x: borderMargin + 4.0, y: 75.0, width: width, height: 20)
        card.name.draw(in: textRectangle)
//        card.name.draw(at: CGPoint(x: borderMargin + 4.0, y: 75.0))
        popContext()
    }
}
