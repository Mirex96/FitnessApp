import UIKit
import Foundation


protocol RingViewDelegate: AnyObject {
    func animationDidEnd()
}

class RingView: UIView {

    var progress: CGFloat = CGFloat(0.5) {
        didSet {
            if progress >= 1.0 {
                progress = 1.0
            } else if progress <= 0.0 {
                progress = 0.0
            }
            ringLayer.strokeEnd = progress
        }
    }
    
    let backdropLayer: CAShapeLayer = CAShapeLayer()
    let ringWidth: CGFloat = CGFloat(40.0)
    var halfRingWidth: CGFloat {
        return ringWidth / 2
    }
    weak var delegate: RingViewDelegate?
    let ringLayer: CAShapeLayer = CAShapeLayer()
    var action: (() -> Void)?
    
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        let circlePath: CGPath = UIBezierPath(ovalIn: CGRect(x: halfRingWidth, y: halfRingWidth, width: bounds.width - ringWidth, height: bounds.height - ringWidth)).cgPath
        let offset = CGFloat(90 * Double.pi / 180)
        backdropLayer.path = circlePath
        backdropLayer.lineWidth = ringWidth
        backdropLayer.strokeEnd = 1.0
        backdropLayer.fillColor = nil
        backdropLayer.strokeColor = UIColor(red: 122/255, green: 25/255, blue: 18/255, alpha: 1.0).cgColor
        layer.addSublayer(backdropLayer)
        
        ringLayer.path = circlePath
        ringLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        ringLayer.lineWidth = ringWidth
        ringLayer.strokeColor = UIColor.black.cgColor
        ringLayer.fillColor = nil
        ringLayer.strokeEnd = 0.5  // Занимает половину круга
        ringLayer.lineCap = CAShapeLayerLineCap.round
        ringLayer.transform = CATransform3DMakeRotation(offset, 0, 0, -1.0)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 231/255, green: 51/255, blue: 38/255, alpha: 1.0).cgColor, UIColor(red: 248/255, green: 255/255, blue: 174/255, alpha: 1.0).cgColor]
        gradientLayer.frame = bounds
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.mask = ringLayer
        layer.addSublayer(gradientLayer)
    }
    
    // Функция, отвечающая за анимацию:
    func startAnimation(time: Int) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = CFTimeInterval(time)
        animation.repeatCount = 1  // Анимация повторится 1 раз
        animation.isRemovedOnCompletion = false // чтобы по ззавершению анимации она не удалялась
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: .linear) // Как замедляется и ускораяется анимация по ходу ее движения
        animation.delegate = self
        ringLayer.add(animation, forKey: nil)
    }

}

extension RingView: CAAnimationDelegate {
    // Когда анимация закончится, метод сообщит нам об этом
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        delegate?.animationDidEnd()
    }
}
