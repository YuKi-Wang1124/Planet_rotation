//
//  ViewController.swift
//  Planet_rotation
//
//  Created by 王昱淇 on 2021/8/31.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var leftMeteoriteImageView: UIImageView!
    @IBOutlet weak var rightMeteoriteImageView: UIImageView!
    @IBOutlet weak var sunImageView: UIImageView!
    @IBOutlet weak var earthImageView: UIImageView!
    @IBOutlet weak var moonImageView: UIImageView!
    @IBOutlet weak var explodeImageView: UIImageView!

    @IBOutlet weak var earthSlider: UISlider!
    
    
     func updateEarthLocation(degrees: CGFloat) {
         let path = UIBezierPath()
         let oneDegree = CGFloat.pi / 180
         let endAngle = oneDegree * degrees
         path.addArc(withCenter: sunImageView.center, radius: 180, startAngle: 0, endAngle: endAngle, clockwise: false)
         earthImageView.center = path.currentPoint
        
         let moonPath = UIBezierPath(arcCenter: earthImageView.center, radius: 80, startAngle: 0, endAngle: 10 * endAngle, clockwise: true)
         moonImageView.center = moonPath.currentPoint
        
        
     }
    
    
    @IBAction func changeEarthSliderValue(_ sender: Any) {
        updateEarthLocation(degrees: CGFloat(earthSlider.value))
    }
    

    
    @IBAction func meteoriteSliderChange(_ sender: UISlider) {
      
        leftMeteoriteImageView.transform = CGAffineTransform(translationX: CGFloat(14 * sender.value), y: CGFloat(-3 * sender.value))
       
        rightMeteoriteImageView.transform = CGAffineTransform(translationX: CGFloat(-14 * sender.value), y: CGFloat(3 * sender.value))
        
        leftMeteoriteImageView.alpha = CGFloat(sender.value/10)
        rightMeteoriteImageView.alpha = CGFloat(sender.value/10)
        
        if sender.value == 24 {
            explodeImageView.isHidden = false
           
        } else {
            explodeImageView.isHidden = true
        }
    
    }
    
    
     override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         updateEarthLocation(degrees: 0)
     
     
     }


    
    @IBAction func oneStepChange(_ sender: Any) {
        earthSlider.value += 5
        updateEarthLocation(degrees: CGFloat(earthSlider.value))
    }
    
}

