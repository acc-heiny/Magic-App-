import UIKit
import SnapKit
import MTGSDKSwift

protocol VisualizationCardsViewDelegate: AnyObject {
    func actionDataSource(card: Card)
}

class VisualizationCardsView: UIView {
    
    weak var delegate: VisualizationCardsViewDelegate?
    var dataSource: VisualizationCardsCollectionViewDataSource = .init(cardsExpansions: [])
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Background")
        image.backgroundColor = UIColor(white: 1, alpha: 0.85)
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var nameExpansion: UILabel = {
        let title = UILabel(frame: .zero)
        title.font = UIFont(name: "Futura-bold", size: 30)
        title.textColor = .white
        title.numberOfLines = 0
        title.textAlignment = .left
        return title
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionLayout: UICollectionViewFlowLayout = .init()
        collectionLayout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.backgroundColor = UIColor(white: 0.5, alpha: 0.0)
        collection.dataSource = dataSource
        collection.delegate = dataSource
        collection.register(VisualizationCardsViewCell.self, forCellWithReuseIdentifier: VisualizationCardsViewCell.identifier)
        return collection
    }()
    
    init(title:String) {
        super.init(frame: .zero)
        nameExpansion.text = title
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateDataSource(card: [Card]) {
        dataSource.updateDataCards(imageCard: card)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension VisualizationCardsView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(backgroundImage)
        addSubview(nameExpansion)
        addSubview(collectionView)
       
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { make in
            
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            
        }
        
        nameExpansion.snp.makeConstraints { make in
            make.width.equalTo(245)
            make.height.equalTo(42)
            make.trailing.equalTo(0)
            make.leading.equalTo(21)
            make.top.equalTo(125)
        }
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.leading.equalTo(26).offset(10)
            make.trailing.equalTo(26).inset(10)
            make.top.equalTo(nameExpansion.snp.bottom).offset(50)
            make.bottom.equalTo(-65)
        }
    }
    
    func setupConfiguration() {
        dataSource.delegate = self
    }
}

extension VisualizationCardsView: VisualizationCardsViewDataSouceDelegate {
    func didSelectCardAt(card: Card) {
        delegate?.actionDataSource(card: card)
    }
}
