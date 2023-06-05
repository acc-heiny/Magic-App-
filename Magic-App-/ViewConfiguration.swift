
import Foundation
protocol ViewConfiguration {
    func buildViewHierarchy()
    func setupConstraints()
    func setupConfiguration()
    func setupView()

}

extension ViewConfiguration {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupConfiguration()
    }
}
