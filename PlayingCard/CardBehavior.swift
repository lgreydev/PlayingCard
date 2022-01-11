//
//  CardBehavior.swift
//  PlayingCard
//
//  Created by Sergey Lukaschuk on 10.01.2022.
//

import UIKit

class CardBehavior: UIDynamicBehavior {
    
    lazy private var collisionBehavior: UICollisionBehavior = {
        let behavior = UICollisionBehavior()
        behavior.translatesReferenceBoundsIntoBoundary = true
        return behavior
    }()
    
    lazy private var itemBehavior: UIDynamicItemBehavior = {
        let behavior = UIDynamicItemBehavior()
        behavior.allowsRotation = false
        behavior.elasticity = 1.0
        behavior.resistance = 0.0
        return behavior
    }()
    
    private func push(_ item: UIDynamicItem) {
        let push = UIPushBehavior(items: [item], mode: .instantaneous)
        if let referenceBounds = dynamicAnimator?.referenceView?.bounds {
            let center = CGPoint(x: referenceBounds.midX, y: referenceBounds.midY)
            switch (item.center.x, item.center.y) {
            case let (x, y) where x < center.x && y < center.y:
                push.angle = (CGFloat.pi/2).random
            case let (x, y) where x > center.x && y < center.y:
                push.angle = CGFloat.pi - (CGFloat.pi/2).random
            case let (x, y) where x < center.x && y > center.y:
                push.angle = (-CGFloat.pi/2).random
            case let (x, y) where x > center.x && y > center.y:
                push.angle = CGFloat.pi + (CGFloat.pi/2).random
            default:
                push.angle = (CGFloat.pi*2).random
            }
        }
        push.magnitude = CGFloat(1.0) + CGFloat(2.0).random
        push.action = {
            self.removeChildBehavior(push)
        }
        addChildBehavior(push)
    }
    
    func addItem(_ item: UIDynamicItem) {
        collisionBehavior.addItem(item)
        itemBehavior.addItem(item)
        push(item)
    }
    
    func removeItem(_ item: UIDynamicItem) {
        collisionBehavior.removeItem(item)
        itemBehavior.removeItem(item)
    }
    
    override init() {
        super.init()
        addChildBehavior(collisionBehavior)
        addChildBehavior(itemBehavior)
    }
    
    convenience init(in animation: UIDynamicAnimator) {
        self.init()
        animation.addBehavior(self)
    }
}
