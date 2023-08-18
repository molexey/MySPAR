//
//  LocationBarView.swift
//  Мой SPAR
//
//  Created by molexey on 16.08.2023.
//

import UIKit

class LocationBarView: UIView {

    // MARK: - Views
    
    private lazy var contentView = UIView()
    private lazy var markerView = UIView()
    
    // MARK: - Init
    
    init() {
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
