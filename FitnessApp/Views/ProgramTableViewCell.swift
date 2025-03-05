import UIKit

class ProgramTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var programImageView: UIImageView!
    static let identifier = "ProgramTableViewCell"
    
    private var gradientLayer: CAGradientLayer?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Установка шрифтов
        titleLabel.font = UIFont.style(.h1)
        durationLabel.font = UIFont.style(.caption)
        caloriesLabel.font = UIFont.style(.caption)
        
        // Чтобы строка таблицы не отображалась серым цветом
        selectionStyle = .none
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Создание градиента
        if gradientLayer == nil {
            let colorTop = UIColor.primary.cgColor
            let colorBottom = UIColor.secondary.cgColor
            
            gradientLayer = CAGradientLayer()
            gradientLayer?.colors = [colorTop, colorBottom]
            gradientLayer?.locations = [0.0, 1.0]
            gradientLayer?.cornerRadius = 8
            
            // Вставка градиента в containerView
            if let gradientLayer = gradientLayer {
                containerView.layer.insertSublayer(gradientLayer, at: 0)
            }
        }
        
        // Обновление границ градиента
        gradientLayer?.frame = containerView.bounds
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
    }

    func configure(withProgram program: Program) {
        titleLabel.text = program.title
        durationLabel.text = "\(program.duration) mins"
        caloriesLabel.text = "\(program.calories) cal"
        
        // Проверка на наличие изображения
        if let image = UIImage(named: program.image) {
            programImageView.image = image
            print("Image loaded successfully: \(program.image)")
        } else {
            print("Image not found: \(program.image)")
            programImageView.image = nil
        }
    }
}
