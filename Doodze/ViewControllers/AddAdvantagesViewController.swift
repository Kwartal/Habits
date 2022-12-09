//
//  AddAdvantagesViewController.swift.swift
//  Doodze
//
//  Created by Богдан Баринов on 07.12.2022.
//

import UIKit
import SnapKit

final class AddAdvantagesViewController: UIViewController {

    // MARK: - UI Elements

    private let someView = UIView()
    private let testButton = UIButton()

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
        view.addSubview(testButton)

        view.backgroundColor = .white

        setupSubviews()
    }

    // MARK: - Actions

    @objc private func testButtonDIDTAP() {
        self.dismiss(animated: true, completion: {
            let vc = MotivationViewController()

            // 'self' refers to FirstController, but you have just dismissed
            //  FirstController! It's no longer in the view hierarchy!
            self.present(vc, animated: true, completion: nil)
        })
    }

}

// MARK: - Layout

extension AddAdvantagesViewController {

    private func addSubviews() {
        view.addSubview(someView)
    }

    private func setupSubviews() {
        addSubviews()

        testButton.backgroundColor = .blue
        testButton.setTitle("TEST", for: .normal)
        testButton.addTarget(self, action: #selector(testButtonDIDTAP), for: .touchUpInside)


        configureConstraints()
    }

    private func configureConstraints() {

        testButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(60)
            $0.size.equalTo(100)
        }
    }

}
