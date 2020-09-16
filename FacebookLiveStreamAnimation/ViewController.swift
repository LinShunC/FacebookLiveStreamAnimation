//
//  ViewController.swift
//  FacebookLiveStreamAnimation
//
//  Created by anyRTC on 2020/9/16.
//  Copyright © 2020 MaoZongWu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let curedView = CurvedView(frame: view.frame)
//        curedView.backgroundColor = .red
//        view.addSubview(curedView)

       
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    @objc func handleTap()
    {
        (0...10).forEach { (_) in
            generateAnimationViews()
        }
    }
     func generateAnimationViews()
    {
        let image = drand48() > 0.5 ? UIImage(named: "thumbs_up") : UIImage(named: "heart")
        let imageView = UIImageView(image:image)
        let dimension = 20 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 2
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        
        imageView.layer.add(animation, forKey: nil)
        view.addSubview(imageView)
    }


}

func customPath() -> UIBezierPath {
            // do some fancy curve drawing
      let path  = UIBezierPath()
      path.move(to: CGPoint(x: 0,y: 200))
    
      let randomYShift = 200 + drand48() * 300
      let endPoint = CGPoint(x: 400, y: 200)
    //  path.addLine(to: endPoint)
      let cp1 = CGPoint(x: 100, y: 100 - randomYShift)
      let cp2 = CGPoint(x: 200, y: 300 + randomYShift)
    

      path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    return path
}
class CurvedView:UIView
{
    override func draw(_ rect: CGRect) {

        let path = customPath()
        path.lineWidth = 3
        path.stroke()
        
    }
}
