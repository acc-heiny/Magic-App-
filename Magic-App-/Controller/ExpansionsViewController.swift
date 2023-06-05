import UIKit
import MTGSDKSwift
class ExpansionsViewController: UIViewController {
    
    var magicService: Magic = Magic()
    var expansionsView: ExpansionsView = ExpansionsView()
    var cardSets: [Sets] = []
    
    override func loadView() {
        self.view = expansionsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSets()
        expansionsView.delegate = self
    }
    
    func alertError() {
        DispatchQueue.main.async {
             let alert: UIAlertController = UIAlertController(title: "Error", message: "Status 500: Servidor fora do ar, tente novamente mais tarde", preferredStyle: .alert)
            let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    func getSets() {
        
        
        guard let fileURL: URL = Bundle.main.url(forResource: "CardSets", withExtension: "json"),
              let jsonData = try? Data(contentsOf: fileURL) else {return}
        
        do {
            cardSets = try JSONDecoder().decode([Sets].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
        self.expansionsView.updateDataSource(setNames: cardSets)
    }
        
//    func getSets() {
//        self.expansionsView.showLoading()
//        magicService.fetchJSON([SetSearchParameter(parameterType: .block, value: "" )]) { [weak self] result in
//
//            switch result {
//
//            case let .success(setsDictonary):
//                self?.expansionsView.removeLoading()
//                guard let self = self,
//                      let sets: [[String: Any]] = setsDictonary["sets"] as? [[String: Any]] else {return}
//
//                var setsNames: [String] = []
//
//                for set in sets {
//                    guard let name: String = set["name"] as? String else {return}
//                    setsNames.append(name)
//                }
//
//
//                self.expansionsView.updateDataSource(setNames: setsNames)
//
//            case let .error(error):
//                print(error)
//
//                self?.alertError()
//            }
//
//        }
//
    }

extension ExpansionsViewController: ExpansionsViewDelegate {
    func didselectedItem(title: String) {
        let visualizationCards = VisualizationCardsViewController(setTitle: title)
        navigationController?.pushViewController(visualizationCards, animated: true)
        
    }
    
}

