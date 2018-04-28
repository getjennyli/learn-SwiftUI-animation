//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class myVC : UIViewController {
  let cardView = UIView()
  let coverImageView = UIImageView()
  let titleLabel = UILabel()
  let priceLabel = UILabel()
  let backgroundImageView = UIImageView()
  let closeButton = UIButton()
  let descLabel = UILabel()
  let shadowView = UIView()
  
  override func loadView() {
    let view = UIView()
    view.backgroundColor = UIColor(red: 2.55, green: 2.03, blue: 0.24, alpha: 1.00)
    
    cardView.frame = CGRect(x: 20, y: 149, width: 280, height: 369)
    cardView.layer.cornerRadius = 14
    cardView.backgroundColor = .white

    titleLabel.frame = CGRect(x: 0, y: 280, width: 280, height: 24)
    titleLabel.text = "Mechanical Keyboard"
    titleLabel.textColor = .black
    titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    titleLabel.textAlignment = .center

    priceLabel.frame = CGRect(x: 0, y: 314, width: 280, height: 38)
    priceLabel.text = "$238.88"
    priceLabel.textColor = .black
    priceLabel.font = UIFont.systemFont(ofSize: 32, weight: .light)
    priceLabel.textAlignment = .center
    
    descLabel.frame = CGRect(x: 30, y: 360, width: 220, height: 23)
    descLabel.text = "$Happy hacking keyboard ! 👾"
    descLabel.textColor = .gray
    descLabel.textAlignment = .center
    descLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    descLabel.alpha = 0
    
    coverImageView.frame = CGRect(x: 15, y: 15, width: 250, height: 250)
    coverImageView.contentMode = .scaleAspectFill
    coverImageView.clipsToBounds = true
    coverImageView.layer.cornerRadius = 14
    coverImageView.image = UIImage(named: "coverImage.jpg")
    
    shadowView.frame = CGRect(x: 18, y: 18, width: 244, height: 244)
    shadowView.backgroundColor = .white
    shadowView.layer.masksToBounds = false
    shadowView.layer.shadowOffset = CGSize(width: 0, height: 11)
    shadowView.layer.shadowColor = UIColor.black.cgColor
    shadowView.layer.shadowOpacity = 0.3
    shadowView.layer.shadowRadius = 12
    shadowView.alpha = 0
    
    backgroundImageView.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
    backgroundImageView.image = #imageLiteral(resourceName: "background@2x.png")
    
    cardView.addSubview(shadowView)
    cardView.addSubview(titleLabel)
    cardView.addSubview(shadowView)
    cardView.addSubview(priceLabel)
    cardView.addSubview(descLabel)
    cardView.addSubview(coverImageView)

    view.addSubview(backgroundImageView)
    view.addSubview(cardView)

    let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
    swipeUp.direction = UISwipeGestureRecognizerDirection.up
    cardView.addGestureRecognizer(swipeUp)

    let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
    swipeDown.direction = UISwipeGestureRecognizerDirection.down
    
    cardView.addGestureRecognizer(swipeDown)
    cardView.isUserInteractionEnabled = true
    
    self.view = view
  }
  
  @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
    if let swipeGesture = gesture as? UISwipeGestureRecognizer {
      switch swipeGesture.direction {
      case UISwipeGestureRecognizerDirection.up:
        print("Swiped up")
        let animator = UIViewPropertyAnimator(duration: 0.6, dampingRatio: 0.6) {
          self.backgroundImageView.image = #imageLiteral(resourceName: "open_bg@2x.png")
          self.cardView.frame = CGRect(x: 34, y: 231, width: 307, height: 317)
          self.titleLabel.frame = CGRect(x: 0, y: 196, width: 307, height: 24)
          self.priceLabel.frame = CGRect(x: 0, y: 230, width: 307, height: 38)
          self.descLabel.frame = CGRect(x: 44, y: 276, width: 220, height: 23)
          self.coverImageView.frame = CGRect(x: 15, y: -106, width: 278, height: 278)

          self.shadowView.frame = CGRect(x: 21, y: -99, width: 266, height: 266)
          self.shadowView.alpha = 1
          
          self.coverImageView.layer.shadowColor = UIColor.black.cgColor
          self.coverImageView.layer.shadowOpacity = 0.5
          self.coverImageView.layer.shadowOffset = CGSize.zero
          self.coverImageView.layer.shadowRadius = 8
          
          self.descLabel.alpha = 1
        }
        animator.startAnimation()
        
      case UISwipeGestureRecognizerDirection.down:
        print("Swiped down")
          let animator = UIViewPropertyAnimator(duration: 0.7, dampingRatio: 0.7) {
            self.cardView.frame = CGRect(x: 20, y: 149, width: 280, height: 369)
            self.titleLabel.frame = CGRect(x: 0, y: 280, width: 280, height: 24)
            self.priceLabel.frame = CGRect(x: 0, y: 314, width: 280, height: 38)
            self.shadowView.frame = CGRect(x: 18, y: 18, width: 244, height: 244)
            self.shadowView.alpha = 0
            self.coverImageView.frame = CGRect(x: 15, y: 15, width: 250, height: 250)
            self.descLabel.frame = CGRect(x: 30, y: 360, width: 220, height: 23)
            self.descLabel.alpha = 0
            self.backgroundImageView.image = #imageLiteral(resourceName: "background@2x.png")
          }
          animator.startAnimation()
      default:
        break
      }
    }
  }
     
}
PlaygroundPage.current.liveView = myVC()
