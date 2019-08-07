//
//  MusicDownloadButton.swift
//  TestProj
//
//  Created by Rafael Costa on 23/05/19.
//  Copyright © 2019 Rafael Costa. All rights reserved.
//

import UIKit

public protocol MusicDownloadButtonDelegate {
    func startDownload()
    func stopDownload()
}

public class MusicDownloadButton: UIView {
    
    public var delegate: MusicDownloadButtonDelegate?
    
    public enum State {
        case normal
        case downloading
        case downloaded
    }
    
    public var progress: Double = 0.0 {
        didSet {
            if let circularProgressView = self.subviews.first(where: { (view) -> Bool in
                view is CircularProgressView
            }) as? CircularProgressView {
                circularProgressView.progress = CGFloat(self.progress)
            }
        }
    }
    
    public var state: MusicDownloadButton.State = .normal {
        didSet {
            self.setupMode()
        }
    }

    public var color: UIColor = UIColor.white {
        didSet {
            self.setupMode()
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.setupMode()
    }
    
    func setupMode() {
        let bundle = Bundle(for: MusicDownloadButton.self)
        
        for view in self.subviews {
            view.removeFromSuperview()
        }
        
        switch self.state {
        case .normal:
            
            var frame = self.bounds
            frame.size.width -= 4
            frame.size.height -= 4
            frame.origin.x += 2
            frame.origin.y += 2
            
            let innerButton = UIButton(frame: frame)
            innerButton.setImage(UIImage(named: "download_icon", in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate), for: .normal)
            innerButton.addTarget(self, action: #selector(self.downloadButtonPressed), for: .touchUpInside)
            self.addSubview(innerButton)
        case .downloading:
            let innerProgressView = CircularProgressView(frame: self.bounds)
            innerProgressView.tintColor = self.color
            innerProgressView.isUserInteractionEnabled = true
            innerProgressView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.downloadButtonPressed)))
            
            var squareFrame = self.bounds
            squareFrame.size.width = squareFrame.size.width * 0.25
            squareFrame.size.height = squareFrame.size.height * 0.25
            
            squareFrame.origin.x = self.bounds.width/2 - squareFrame.size.width/2
            squareFrame.origin.y = self.bounds.height/2 - squareFrame.size.height/2
            
            let square = UIView(frame: squareFrame)
            square.backgroundColor = self.color
            
            self.addSubview(square)
            self.addSubview(innerProgressView)
            
        case .downloaded:
            let imageView = UIImageView(image: UIImage(named: "downloaded_icon", in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate))
            imageView.frame = self.bounds
            self.addSubview(imageView)
        }
    }
    
    @objc func downloadButtonPressed() {
        switch self.state {
        case .normal:
            self.delegate?.startDownload()
        case .downloading:
            self.delegate?.stopDownload()
        case .downloaded:
            print("Do nothing...")
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
