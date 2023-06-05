
import UIKit
import SnapKit

class VisualizationCardsViewCell: UICollectionViewCell {
    
   static var identifier = "VisualizationCardsViewCell"
    
    lazy var cardImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func prepare(with image: String) {
        
//        let urlSafe: String = url.replacingOccurrences(of: "http:", with: "https:")
//        guard let url: URL = .init(string: urlSafe)  else
//        { return }
//
//        if let data: Data = try? Data(contentsOf: url) {
            cardImageView.image = UIImage(named: image)
        
    }
}

extension VisualizationCardsViewCell: ViewConfiguration {
    
    func buildViewHierarchy() {
        
        contentView.addSubview(cardImageView)
    }
    
    func setupConstraints() {
        
        cardImageView.snp.makeConstraints { make in
            make.width.equalTo(400)
            make.height.equalTo(400)
            make.leading.equalTo(26).offset(10)
            make.trailing.equalTo(26).inset(10)
            make.top.equalTo(9)
            make.bottom.equalTo(0)
            
        }
    }
    
    func setupConfiguration() {
        //
    }
}
