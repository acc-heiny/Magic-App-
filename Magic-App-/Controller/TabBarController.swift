import UIKit
import SnapKit

class MyTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarController()
        self.setupColorTabBar()
        self.setupBorders()
    }
    
     func setupTabBarController() {
        let expansionsView = ExpansionsViewController()
        let tabExpansions = UITabBarItem(title: "Expansions", image: UIImage(named: "defaultImage"), selectedImage: UIImage(named: "defaultImage"))
        expansionsView.tabBarItem = tabExpansions
        

        let myCards = MyCardsViewController()
        let tabMyCards = UITabBarItem(title: "My Card", image: UIImage(named: "defaultImaage2"), selectedImage: UIImage(named: "defaultImage2"))
        myCards.tabBarItem = tabMyCards
        
        self.setViewControllers([expansionsView, myCards], animated: false)
        
        setupFonts( itemOne: tabExpansions, itemTwo: tabMyCards)
    }
    
    func setupColorTabBar() {
        
        tabBar.backgroundColor = .clear
        tabBar.tintColor = .white
        tabBar.barTintColor = .white
    }
    
    func setupFonts(itemOne: UITabBarItem, itemTwo: UITabBarItem) {
        
        let font = UIFont.systemFont(ofSize: 16)
        
        itemOne.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: font as Any,], for: UIControl.State.normal)

        itemOne.titlePositionAdjustment = UIOffset(horizontal: 16, vertical: -16)

        itemTwo.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: font as Any,], for: UIControl.State.normal)
        
        itemTwo.titlePositionAdjustment = UIOffset(horizontal: -16, vertical: -16)
    }
    
    func setupBorders() {
        let topBorder = UIView()
        let centerBorder = UIView()
        
        topBorder.backgroundColor = .white
        centerBorder.backgroundColor = .white
        
        self.tabBar.addSubview(topBorder)
        self.tabBar.addSubview(centerBorder)
        
        topBorder.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(327)
            make.height.equalTo(1)
        }
        
        centerBorder.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.top.equalTo(4)
            make.width.equalTo(1)
            make.height.equalTo(50)
        }
    }
}
