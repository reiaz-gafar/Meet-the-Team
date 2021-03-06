//
//  TrapezoidView.swift
//  Meet the Team
//
//  Created by Reiaz Gafar on 6/14/18.
//  Copyright © 2018 Reiaz Gafar. All rights reserved.
//

import UIKit

class TrapezoidView: UIView {
    
    // MARK: - Properties
    var offsetHeight: CGFloat {
        return self.bounds.height * 2.5
    }
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
    }
    
    // MARK: - Custom Shape Using Bezier Path: Trapezoid
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: -6.0, y: 6.0))
        path.addLine(to: CGPoint(x: self.frame.size.width + 6, y: 95))
        path.addLine(to: CGPoint(x: self.frame.size.width + 6, y: self.frame.size.height + 6))
        path.addLine(to: CGPoint(x: -6.0, y: self.frame.size.height + 6))
        path.close()

        UIColor.white.setFill()
        path.fill()
        
        path.lineWidth = 6
        Styles.Color.cmbBlue.setStroke()
        path.stroke()
    }
    
}


