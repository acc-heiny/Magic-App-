import UIKit

protocol CollectionViewDataSourceDelegate: AnyObject {
    func didSelectedItemAt(title: String)
}

final class ExpansionsCollectionViewDataSource: NSObject {
    
    weak var delegate: CollectionViewDataSourceDelegate?
    var expansions: [Sets]
    
    init(expansions: [Sets]) {
        self.expansions = expansions
        super.init()
    }
    
    func updateData(expansionsName: [Sets]) {
        expansions = expansionsName
    }
}

extension ExpansionsCollectionViewDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return expansions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        guard let MyCell = headerCell as? MyCell else { return UICollectionViewCell()}
        let nameSets = expansions[indexPath.row]
        MyCell.prepare(with: nameSets.name)
        
        return MyCell
    }
    
  
}
extension ExpansionsCollectionViewDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let clickNameSets = expansions[indexPath.row]
        delegate?.didSelectedItemAt(title: clickNameSets.name)
    }
    
}
