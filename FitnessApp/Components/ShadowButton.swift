import UIKit
import Foundation

class ShadowButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.font = UIFont.style(.buttonTitle)
        backgroundColor = UIColor.primary
        layer.shadowColor = UIColor.secondary.cgColor
        layer.masksToBounds = false
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5 
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
    }
}
