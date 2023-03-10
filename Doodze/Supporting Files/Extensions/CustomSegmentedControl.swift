//
//  Custom.swift
//  Doodze
//
//  Created by Богдан Баринов on 09.03.2023.
//

import UIKit
import SnapKit

final class CustomSegmentedControl: UIView {

    // MARK: - Private lazy Properties

    private lazy var segmentedControl: UISegmentedControl = {
       let segmentedControl = UISegmentedControl(
        items: ["Все", "Следующие", "Прошедшие"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(selectSegment), for: .valueChanged)

        segmentedControl.backgroundColor = .clear
        segmentedControl.selectedSegmentTintColor = .clear
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: UIControl.State.selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: UIControl.State.normal)

        return segmentedControl
    }()

    private lazy var segmentedIndicate: UIView = {
        let view = UIView()
        view.backgroundColor = .orange

        return view
    }()

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

        // MARK: - Settings UIView

private extension CustomSegmentedControl {
    func setupView() {
        addSubviews(segmentedControl, segmentedIndicate)
        backgroundColor = .clear
        setupLayout()
    }
}

    // MARK: - @Objc Method

private extension CustomSegmentedControl {
    @objc func selectSegment(_ sender: UISegmentedControl) {
        let numberOfSegments = CGFloat(segmentedControl.numberOfSegments)
        let selectedIndex = CGFloat(sender.selectedSegmentIndex)
        let titleCount = CGFloat((segmentedControl.titleForSegment(at: sender.selectedSegmentIndex)?.count ?? 0))

        changeIndicatorLayout(
            numberOfSegments, selectedIndex: selectedIndex, titleCount: titleCount)
        animationIndicator()
    }

    func changeIndicatorLayout(_ numbers: CGFloat, selectedIndex: CGFloat, titleCount: CGFloat) {
        segmentedIndicate.snp.remakeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(3)
            make.height.equalTo(2)

            make.width.equalTo(15 + titleCount * 8)
            make.centerX.equalTo(segmentedControl.snp.centerX).dividedBy(numbers / CGFloat(3.0 + (selectedIndex - 1.0) * 2.0))
        }
    }

    func animationIndicator() {
        UIView.animate(withDuration: 0.5, animations: {
            self.layoutIfNeeded()
            self.segmentedIndicate.transform = CGAffineTransform(scaleX: 1.4, y: 1)
        }) { (finished) in
            UIView.animate(withDuration: 0.5) {
                self.segmentedIndicate.transform = CGAffineTransform.identity
            }
        }
    }
}

    // MARK: - Layout

private extension CustomSegmentedControl {
    func setupLayout() {
        setupSegmentedControlLayout()
        setupIndicatiorLayout()
    }

    func setupSegmentedControlLayout() {
        segmentedControl.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
    }

    func setupIndicatiorLayout() {
        segmentedIndicate.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(3)
            make.height.equalTo(2)

            make.width.equalTo(
                15 + (segmentedControl.titleForSegment(at: 0)?.count ?? 0) * 8)
            make.centerX.equalTo(segmentedControl.snp.centerX)
                .dividedBy(segmentedControl.numberOfSegments)
        }
    }
}
