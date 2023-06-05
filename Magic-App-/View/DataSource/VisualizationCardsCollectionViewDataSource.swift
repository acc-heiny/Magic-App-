import UIKit

protocol VisualizationCardsViewDataSouceDelegate: AnyObject {
    func didSelectCardAt(card: Card)
}

final class VisualizationCardsCollectionViewDataSource: NSObject {
    
    weak var delegate: VisualizationCardsViewDataSouceDelegate?
    var cardsExpansion: [Card]
    
    init(cardsExpansions: [Card]) {
        self.cardsExpansion = cardsExpansions
        super.init()
    }
    
    func updateDataCards(imageCard: [Card]) {
        cardsExpansion = imageCard
    }
}

extension VisualizationCardsCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsExpansion.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let firstCell = collectionView.dequeueReusableCell(withReuseIdentifier: VisualizationCardsViewCell.identifier, for: indexPath)
        
        guard let cardsExpansionsViewCell = firstCell as? VisualizationCardsViewCell else { return UICollectionViewCell()}
        let imageCards = cardsExpansion[indexPath.row]
        cardsExpansionsViewCell.prepare(with: imageCards.image)
//        
        return cardsExpansionsViewCell
    }
}
extension VisualizationCardsCollectionViewDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedLetter = cardsExpansion[indexPath.row]
        delegate?.didSelectCardAt(card: selectedLetter)
    }
}

extension VisualizationCardsCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 120)
    }
    
}
