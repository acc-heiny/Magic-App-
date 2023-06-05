import UIKit
import SnapKit

class MyCardsView: UIView {
    
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Background")
        image.backgroundColor = UIColor(white: 1, alpha: 0.85)
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var nameExpansion: UILabel = {
        let title = UILabel(frame: .zero)
        title.font = UIFont(name: "Futura-Bold", size: 30)
        title.textColor = .white
        title.textAlignment = .center
        return title
    }()
    
    lazy var cardImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    func updateCardView(title: String?, Image: UIImage?) {
        nameExpansion.text = title
        cardImageView.image = Image
    }
     
    
}

extension MyCardsView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(backgroundImage)
        addSubview(cardImageView)
        addSubview(nameExpansion)
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { make in
            
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            
        }
        
        nameExpansion.snp.makeConstraints { make in
            
            make.width.equalTo(355)
            make.height.equalTo(35)
            make.leading.equalTo(40).inset(10)
            make.top.equalTo(136)
            
        }
        
        cardImageView.snp.makeConstraints { make in
            make.width.equalTo(275)
            make.height.equalTo(370)
            make.leading.equalTo(55)
            make.top.equalTo(250)
        }
        
    }
    
    func setupConfiguration() {
        //
    }
}

