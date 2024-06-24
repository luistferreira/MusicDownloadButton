//
//  CircularProgressView.swift
//  Clock I/O
//
//  Created by Rafael Costa on 14/03/18.
//  Copyright © Rafael Costa. All rights reserved.
//

import UIKit

class CircularProgressView: UIView {
    
    private var progressLayer: CAShapeLayer? = CAShapeLayer()
    
    public var progressColor: UIColor = UIColor.white {
        didSet {
            self.progressLayer?.strokeColor = self.progressColor.cgColor
        }
    }
    
    public var width = 2.5
    public var progress: CGFloat = 0.0 {
        didSet {
            self.animateChange()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    func animateChange() {
        self.progressLayer?.strokeColor = self.progressColor.cgColor
        self.progressLayer?.strokeEnd = self.progress
    }
    
    func setup() {
        let width: CGFloat = CGFloat(self.width)
        let bezierPath = UIBezierPath(ovalIn: CGRect(x: width/2, y: width/2, width: bounds.width - width, height: bounds.height - width))
        
        let maskLayer = CAShapeLayer()
        maskLayer.strokeColor = UIColor.black.cgColor
        maskLayer.fillColor   = UIColor.clear.cgColor
        maskLayer.lineWidth = width
        maskLayer.lineCap = CAShapeLayerLineCap.round
        maskLayer.path = bezierPath.cgPath
        
        self.progressLayer?.lineCap = CAShapeLayerLineCap.round
        self.progressLayer?.path = bezierPath.cgPath
        
        self.progressLayer?.strokeColor = self.progressColor.cgColor
        self.progressLayer?.fillColor   = UIColor.clear.cgColor
        self.progressLayer?.lineWidth = width
        
        self.progressLayer?.mask = maskLayer
        self.layer.addSublayer(self.progressLayer!)
        self.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
    }
    
}
