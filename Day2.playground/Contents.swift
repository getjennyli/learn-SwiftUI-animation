//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class myVC: UIViewController {
  let baseImg = UIImageView()
  let pin = UIImageView()
  let shadow = UIImageView()
  let baseView = UIView()
  let pinView = UIView()
  let backgroundView = UIImageView()

  override func loadView() {
    let view = UIView()
    
    backgroundView.image = #imageLiteral(resourceName: "bg.png")
    backgroundView.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
    
    pinView.frame = CGRect(x: 159, y: 171, width: 58, height: 83)
    pinView.backgroundColor = .clear
    baseImg.frame = CGRect(x: 70, y: 171, width: 232, height: 176)
    baseImg.image = #imageLiteral(resourceName: "map.png")
    
    pin.frame = CGRect(x: 0, y: 0, width: 58, height: 83)
    pin.image = #imageLiteral(resourceName: "pin.png")
    
    shadow.frame = CGRect(x: 170, y: 264, width: 36, height: 5)
    shadow.image = #imageLiteral(resourceName: "shadow.png")
    
    view.addSubview(backgroundView)
    view.addSubview(baseImg)
    view.addSubview(pin)
    pinView.addSubview(pin)
    view.addSubview(pinView)
    view.addSubview(shadow)
    
  
    let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
    pinView.addGestureRecognizer(tap)
    self.view = view
  }
  @objc func handleTap(gesture: UITapGestureRecognizer) {
    UIView.animate(withDuration: 1.5, delay: 0, options: [.repeat, .autoreverse, .curveEaseInOut], animations: {
      self.pinView.frame.origin.y -= 11
      self.shadow.frame = CGRect(x: 171, y: 264, width: 33, height: 4.48)
      // TODO: Add flip pin gesture
    }, completion: nil)
  }
}

PlaygroundPage.current.liveView = myVC()
