//
//  Extensions.swift
//  WebBridge
//
//  Created by 손창빈 on 2020/11/24.
//

import UIKit

extension UIView {
    func viewAddWithAutoLayout(_ contentView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = contentView.frame
        contentView.addSubview(self)
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
    }
}
