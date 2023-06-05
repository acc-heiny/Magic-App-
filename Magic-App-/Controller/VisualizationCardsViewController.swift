import Foundation
import UIKit


class VisualizationCardsViewController: UIViewController {
    
    //var magicService: Magic = Magic()
    lazy var visualizationCardsView: VisualizationCardsView = VisualizationCardsView(title: setTitleItem)
    var setTitleItem: String
    var cardsArray: [Card] = []
    
    init(setTitle: String) {
        self.setTitleItem = setTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = visualizationCardsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualizationCardsView.delegate = self
        getExpansion()
    }
    
    
    func alertError() {
        DispatchQueue.main.async {
             let alert: UIAlertController = UIAlertController(title: "Error", message: "Status 500: Servidor fora do ar, tente novamente mais tarde", preferredStyle: .alert)
            let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func getExpansion() {
        
        guard let fileURL: URL = Bundle.main.url(forResource: "Card", withExtension: "json"),
              let jsonData = try? Data(contentsOf: fileURL) else {return}
        
        do {
            cardsArray = try JSONDecoder().decode([Card].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
        self.visualizationCardsView.updateDataSource(card: cardsArray)
    }
    
//        magicService.fetchSets([.init(parameterType: .name, value: setTitleItem)]) { [weak self] result in
//            
//            switch result {
//            case let .success(setsArray):
//                self?.visualizationCardsView.removeLoading()
//                guard let self = self,
//                      let set: CardSet = setsArray.first, let code: String = set.code else { return }
//                
//               self.getCards(with: code)
//                
//            case let .error(error):
//                print(error)
//                self?.alertError()
//            }
//        }
    }
    
   // func getCards(with code: String) {
        
//        self.visualizationCardsView.showLoading()
//
//        magicService.fetchCards([.init(parameterType: .set, value: code)]) { result in
//
//            switch result {
//            case let .success(cardsArray):
//                self.visualizationCardsView.removeLoading()
//
//                self.visualizationCardsView.updateDataSource(card: cardsArray)
//
//            case let .error(error):
//                print(error)
//
//
//            }
//
//        }
        
extension VisualizationCardsViewController: VisualizationCardsViewDelegate {
    func actionDataSource(card:Card) {
        let detailCard = DetailsCardViewController(selectedCard: card)
        navigationController?.pushViewController(detailCard, animated: true)
    }
}
