import SnapKit
import UIKit

final class MyCell: UICollectionViewCell {
    
    private lazy var headerLabel: UILabel = {
        let label: UILabel = .init(frame: .zero)
        label.font = UIFont(name: "Futura", size: 20)
        label.textColor = .white
        label.layer.borderColor = UIColor.white.cgColor
        return label
        
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func prepare(with text: String) {
        headerLabel.text = text
    }
}
extension MyCell: ViewConfiguration {
    
    func buildViewHierarchy() {
        contentView.addSubview(headerLabel)
    }
    
    func setupConstraints() {
        headerLabel.snp.makeConstraints{ make in
            
            make.width.equalTo(10)
            make.height.equalTo(21)
            make.leading.equalTo(16)
            make.center.equalToSuperview()
                        
        }
    }
    
    func setupConfiguration() {
        backgroundColor = .clear
        
    }
}


