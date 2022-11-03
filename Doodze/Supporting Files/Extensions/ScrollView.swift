//
//  ScrollView.swift
//  Doodze
//
//  Created by Богдан Баринов on 02.11.2022.
//

import UIKit

final class ScrollView: UIScrollView {
    
    private(set) lazy var contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(contentView)
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().priority(.low)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
