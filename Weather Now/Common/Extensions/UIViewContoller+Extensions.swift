//
//  UIViewContoller+Extensions.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

extension UIViewController {
    func addChildController(_ child: UIViewController) {
        self.addChild(child)
        child.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(child.view)
        self.view.bringSubviewToFront(child.view)
        child.didMove(toParent: self)
    }
}
