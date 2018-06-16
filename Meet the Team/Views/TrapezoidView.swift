//
//  TrapezoidView.swift
//  Meet the Team
//
//  Created by Reiaz Gafar on 6/14/18.
//  Copyright © 2018 Reiaz Gafar. All rights reserved.
//

import UIKit

class TrapezoidView: UIView {
    
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
    
    // MARK: - Custom Shape Using Bezier Path
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: -5.0, y: 5.0))
        path.addLine(to: CGPoint(x: self.frame.size.width + 5, y: self.frame.size.height * 0.20))
        path.addLine(to: CGPoint(x: self.frame.size.width + 5, y: self.frame.size.height + 5))
        path.addLine(to: CGPoint(x: -5.0, y: self.frame.size.height + 5))
        path.close()
        
        UIColor.white.setFill()
        path.fill()
        
        path.lineWidth = 5
        Styles.Color.cmbBlue.setStroke()
        path.stroke()
    }
    
}


