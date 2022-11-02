//
//  AddSubviews.swift
//  Doodze
//
//  Created by Богдан Баринов on 02.11.2022.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
    
    func removeSubviews() {
        subviews.forEach {
            $0.removeFromSuperview()
            $0.snp.removeConstraints()
        }
    }
    
    func superview(className: String) -> UIView? {
        var view: UIView? = self
        
        while view?.className != className {
            if view?.superview == nil {
                view = nil
                break
            } else {
                view = view?.superview
            }
        }
        
        return view
    }
    
    var className: String {
        return String(describing: type(of: self))
    }
    
}
