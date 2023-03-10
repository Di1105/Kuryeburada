//
//  Presentation.swift
//  Font Changer
//
//  Created by Y. Yılmaz Erdoğmuş on 07.12.2022.
//

import Foundation
import Hero
import UIKit

final class Presentation {
    enum Direction {
        case right
        case left
        case up
        case down
    }
    static func presentVC(currentVC: UIViewController, destinationVC: UIViewController, toDirection: Direction) {
        switch toDirection {
        case .left:
            destinationVC.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .right),
                                                              dismissing: .slide(direction: .left))
        case .right:
            destinationVC.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .left),
                                                              dismissing: .slide(direction: .right))
        case .up:
            destinationVC.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .down),
                                                              dismissing: .slide(direction: .up))
        case .down:
            destinationVC.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .up),
                                                              dismissing: .slide(direction: .down))
        }

        destinationVC.isHeroEnabled = true
        destinationVC.modalPresentationStyle = .fullScreen
        currentVC.present(destinationVC, animated: true)
    }

    static func presentVCWithoutAnimation(currentVC: UIViewController, destinationVC: UIViewController) {
        destinationVC.modalPresentationStyle = .fullScreen
        currentVC.present(destinationVC, animated: false)
    }

    static func presentAsPageSheet(currentVC: UIViewController, destinationVC: UIViewController) {
        destinationVC.modalPresentationStyle = .pageSheet
        currentVC.present(destinationVC, animated: true)
    }
}
