import UIKit
import SnapKit

protocol ExpansionsViewDelegate: AnyObject {
    func didselectedItem(title:String)
}

class ExpansionsView: UIView {
    
    weak var delegate: ExpansionsViewDelegate?
    var dataSource: ExpansionsCollectionViewDataSource = .init(expansions: [])
    
    lazy var backgroundImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Background")
        image.backgroundColor = UIColor(white: 1, alpha: 0.85)
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var titleExpansions: UILabel = {
        let title = UILabel(frame: .zero)
        title.text = "Expansions"
        title.font = UIFont(name: "Futura-Bold", size: 36)
        title.textColor = .white
        title.textAlignment = .left
        return title
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionLayout: UICollectionViewFlowLayout = .init()
        collectionLayout.itemSize = .init(width: UIScreen.main.bounds.size.width, height: 40)
        collectionLayout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.dataSource = dataSource
        collection.delegate = dataSource
        collection.backgroundColor = .clear
        collection.layer.borderColor = UIColor.white.cgColor
        collection.register(MyCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
      
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateDataSource(setNames: [Sets]) {
        dataSource.updateData(expansionsName: setNames)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
    }
}

extension ExpansionsView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(backgroundImage)
        addSubview(titleExpansions)
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { make in
            
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            
        }
        
        titleExpansions.snp.makeConstraints { make in
            
            make.width.equalTo(700)
            make.height.equalTo(42)
            make.leading.equalTo(16)
            make.top.equalTo(64)
        }
        
        collectionView.snp.makeConstraints { make in
            
            make.top.equalTo(130)
            make.bottom.equalTo(200)
            make.leading.trailing.equalToSuperview()
        }
        
    }
    
    func setupConfiguration() {
        dataSource.delegate = self
    }
}

extension ExpansionsView: CollectionViewDataSourceDelegate {
    func didSelectedItemAt(title: String) {
        delegate?.didselectedItem(title: title)
    }
    
}


    

