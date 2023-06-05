import UIKit
import SnapKit
import MTGSDKSwift

final class DetailsCardViewController: UIViewController {
    
    var magicSerivice: Magic = Magic()
    var detailCards: DetailCardView = DetailCardView()
    var detailCardSelected: Card
    
    init(selectedCard: Card) {
        self.detailCardSelected = selectedCard
        super.init(nibName: nil, bundle: nil)
        getCard(card: selectedCard)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = detailCards
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailCards.delegate = self
        updateViewAccordingToSelectedCard()
        }
    
    func updateViewAccordingToSelectedCard() {
        
        let defaults: UserDefaults = .standard
        guard let selectedCard: String = defaults.string(forKey: "favoriteCard"),
              selectedCard == detailCardSelected.name else { return }
        detailCards.updateButtonText(isFavorite: true)
    }
    
    func getCard(card: Card) {

        self.detailCards.updateView(titleCard: card.name, imageCard: UIImage(named: card.image) ?? UIImage())
    }
    
    //
    //   func getCard() {
    //
    //
    //        detailCards.showLoading()
    //        magicSerivice.fetchCards([.init(parameterType: .name, value: detailCardSelected )]) {  result in
    //
    //            switch result {
    //
    //            case let .success(cardsArray):
    //                self.detailCards.removeLoading()
    //                guard let card: Card = cardsArray.first(where: { card in
    //                    card.imageUrl != nil
    //                })
    //
    //                else {
    //                    return
    //                }
    //                self.getImageCard(card: card)
    //
    //            case let .error(error):
    //                print(error)
    //            }
    //
    //        }
    //  }
    
    //    func getImageCard(card: Card) {
    //        magicSerivice.fetchImageForCard(card, completion: {
    //            [weak self] result in
    //
    //            switch result {
    //
    //            case let .success(imageCard):
    //                guard let self = self else { return }
    //
    //                self.detailCards.updateView(titleCard: card.name, imageCard: imageCard)
    //
    //            case let .error(error):
    //                print(error)
    //            }
    //        })
    //
    //        var cardCopy = card
    //        cardCopy.imageUrl = cardCopy.imageUrl?.replacingOccurrences(of: "http:", with: "https:")
    //        guard let imageUrl: String = cardCopy.imageUrl, let url: URL = .init(string: imageUrl)  else
    //        { return }
    //
    //        if let data: Data = try? Data(contentsOf: url) {
    //            detailCards.updateView(titleCard: cardCopy.name, imageCard: UIImage(data: data))
    //        }
    //
    //    }
}
    
extension DetailsCardViewController: DetailsCardViewDelegate {
    
    func addToFavorites() {
        
        let defaults: UserDefaults = .standard
        
        guard let favoriteCard: String = defaults.string(forKey: "favoriteCard"),
              favoriteCard == detailCardSelected.name else { // cenario de eu não ter uma carta salva ainda
            defaults.set(detailCardSelected.name, forKey: "favoriteCard")
            detailCards.updateButtonText(isFavorite: true)
            
            let myCard = MyCardsViewController()
            navigationController?.pushViewController(myCard, animated: true)
            return
        }
        defaults.removeObject(forKey: "favoriteCard")
        
        detailCards.updateButtonText(isFavorite: false)
    }
}
