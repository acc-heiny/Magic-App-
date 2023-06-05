import UIKit
import SnapKit
protocol DetailsCardViewDelegate: AnyObject {
    func addToFavorites()
}


class DetailCardView: UIView {
    
    weak var delegate: DetailsCardViewDelegate?
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Background")
        image.backgroundColor = UIColor(white: 1, alpha: 0.85)
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var titleCardLabel: UILabel = {
        let title = UILabel(frame: .zero)
        title.font = UIFont(name: "Futura-Bold", size: 15)
        title.textColor = .white
        title.textAlignment = .center
      //  title.numberOfLines = 0
        return title
    }()
    
    lazy var cardImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var AddFavoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("add to favorites", for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(addToFavoritesButton), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateButtonText(isFavorite: Bool) {
        
        if isFavorite {
            AddFavoriteButton.setTitle("remove from favorites", for: .normal)
            AddFavoriteButton.backgroundColor = .red
        }
        else {
            AddFavoriteButton.setTitle("add to favorites", for: .normal)
            AddFavoriteButton.backgroundColor = .clear
            
        }
    }
    
    @objc func addToFavoritesButton() {
        print("teste")
        delegate?.addToFavorites()
    }
    
    
    func updateView(titleCard: String?, imageCard: UIImage?) {
        
        DispatchQueue.main.async { [self] in
            self.titleCardLabel.text = titleCard
            cardImageView.image = imageCard
        }
    }
}

extension DetailCardView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(backgroundImage)
        addSubview(titleCardLabel)
        addSubview(cardImageView)
        addSubview(AddFavoriteButton)
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { make in
            
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        titleCardLabel.snp.makeConstraints { make in
            
            make.width.equalTo(355)
            make.height.equalTo(35)
            make.leading.equalTo(40).inset(10)
            make.top.equalTo(136)
            
        }
        
        AddFavoriteButton.snp.makeConstraints { make in
            make.width.equalTo(258)
            make.height.equalTo(48)
            make.leading.equalTo(60).inset(20)
            make.trailing.equalTo(60).inset(20)
            make.top.equalTo(655)
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
