//
//  ProfileViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 01.11.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private let someView = UIView()
    
    // MARK: - Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
    }
    
    // MARK: - Actions
    
}

// MARK: - Layout

extension ProfileViewController {
    
    private func addSubviews() {
        view.addSubview(someView)
    }
    
    private func setupSubviews() {
        addSubviews()
        
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        
    }
    
}
