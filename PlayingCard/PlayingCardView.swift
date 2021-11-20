//
//  PlayingCardView.swift
//  PlayingCard
//
//  Created by Sergey Lukaschuk on 20.11.2021.
//

import UIKit

class PlayingCardView: UIView {
    
    var rank: Int = 5 { didSet { setNeedsDisplay(); setNeedsLayout() } }
    var suit: String = "♥️" { didSet { setNeedsDisplay(); setNeedsLayout() } }
    var isFaceUp: Bool = true { didSet { setNeedsDisplay(); setNeedsLayout() } }
    
    private var cornerString: NSAttributedString {
        centeredAttributedString(<#T##String#>, fontSize: 0.0)
    }
    
    override func draw(_ rect: CGRect) {
        
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
        
        
        
        /*
        if let context = UIGraphicsGetCurrentContext() {
            context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY),
                           radius: 100,
                           startAngle: 0,
                           endAngle: 2*CGFloat.pi,
                           clockwise: true)
            
            context.setLineWidth(5.0)
            UIColor.green.setFill()
            UIColor.red.setStroke()
            context.strokePath()
            context.fillPath()
        }
        */
        
        /*
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                    radius: 100,
                    startAngle: 0,
                    endAngle: 2*CGFloat.pi,
                    clockwise: true)
        UIColor.green.setFill()
        UIColor.red.setStroke()
        path.lineWidth = 5.0
        path.stroke()
        path.fill()
         */
    }
    
    func centeredAttributedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        return NSAttributedString(string: string, attributes: [.paragraphStyle: paragraphStyle, .font: font])
    }
}
