import Foundation
import UIKit

class MyCardsViewController: UIViewController {
    
    var myCardsView: MyCardsView = MyCardsView()
   
    override func loadView() {
        self.view =  myCardsView   }
          
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        verifySavedCard()
    }

    func verifySavedCard() {
    
        let defaults: UserDefaults = .standard
        
        guard let savedCard: String = defaults.string(forKey: "favoriteCard")
         else {return} 
        myCardsView.updateCardView(title: savedCard, Image: UIImage())
      
    }
}
