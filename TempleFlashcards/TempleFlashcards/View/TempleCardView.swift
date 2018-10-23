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
    var fontSize : CGFloat { return bounds.width * 0.075 }
    
    // MARK: - Helpers
    private func popContext() {
        UIGraphicsGetCurrentContext()?.restoreGState()
    }
    
    private func pushContext() -> CGContext? {
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        return context
    }
    
    private func templeCardFont(ofSize fontSize: CGFloat) -> UIFont {
        if let font = UIFont(name: "Arial", size: fontSize) {
            return font
        }
        
        return UIFont.preferredFont(forTextStyle: .body)
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
        
        let width = bounds.width
        let height = bounds.height
        let templeImageRect = CGRect(x: 0,
                                   y: 0,
                                   width: width,
                                   height: height)
        templeImage.draw(in: templeImageRect)
        
        
    }
    
    private func drawTempleName() {
        if TempleCardsViewController.State.isStudyMode == true {
            return
        }
        
        let font = templeCardFont(ofSize: fontSize)
        let templeText = NSAttributedString(string: card.name,
                                            attributes: [
                                                .font: font,
                                                .foregroundColor: UIColor.white,
                                                .backgroundColor: UIColor.init(white: 0, alpha: 0.6)
            ])
        var textBounds = CGRect.zero
        textBounds.size = templeText.size()
        textBounds.origin = CGPoint(x: (bounds.width - textBounds.width) / 2, y: (bounds.height - textBounds.height) / 1.2)
        templeText.draw(in: textBounds)
        
//        let square = UIBezierPath()
//        let width = bounds.width - (borderMargin * 2)
//        let fillColor : UIColor = UIColor.white.withAlphaComponent(0.75)
//
//        _ = pushContext()
//        fillColor.setFill()
//        square.move(to: CGPoint(x: borderMargin, y: 72.0))
//        square.addLine(to: CGPoint(x: width, y: 72.0))
//        square.addLine(to: CGPoint(x: width, y: 90.0))
//        square.addLine(to: CGPoint(x: borderMargin, y: 90.0))
//        square.close()
//        square.fill()
//        let textRectangle = CGRect(x: borderMargin + 4.0, y: 75.0, width: width, height: 20)
//        card.name.draw(in: textRectangle)
//        popContext()
    }
}
