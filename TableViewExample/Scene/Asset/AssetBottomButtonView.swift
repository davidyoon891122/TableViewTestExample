//
//  AssetBottomButtonView.swift
//  TableViewExample
//
//  Created by iMac on 2022/07/12.
//

import UIKit
import SnapKit

final class AssetBottomButtonView: UIView {
    private lazy var historyButton: UIButton = {
        let button = UIButton()
        button.setTitle("거래내역", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0)
        return button
    }()

    private lazy var firstSeparatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "poweron")
        imageView.tintColor = .lightGray
        return imageView
    }()

    private lazy var transferButton: UIButton = {
        let button = UIButton()
        button.setTitle("이체", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0)
        return button
    }()

    private lazy var secondSeparatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "poweron")
        imageView.tintColor = .lightGray
        return imageView
    }()

    private lazy var fulfillButton: UIButton = {
        let button = UIButton()
        button.setTitle("채우기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0)
        return button
    }()

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AssetBottomButtonView {
    func setupViews() {
        [
            historyButton,
            firstSeparatorImageView,
            transferButton,
            secondSeparatorImageView,
            fulfillButton
        ]
            .forEach {
                addSubview($0)
            }

        historyButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(120.0)
        }

        firstSeparatorImageView.snp.makeConstraints {
            $0.centerY.equalTo(historyButton)
            $0.leading.equalTo(historyButton.snp.trailing)
            $0.height.equalTo(18.0)
            $0.width.equalTo(5.0)
        }

        transferButton.snp.makeConstraints {
            $0.centerY.equalTo(firstSeparatorImageView)
            $0.leading.equalTo(firstSeparatorImageView.snp.trailing)
        }

        secondSeparatorImageView.snp.makeConstraints {
            $0.centerY.equalTo(transferButton)
            $0.leading.equalTo(transferButton.snp.trailing)
            $0.height.equalTo(18.0)
            $0.width.equalTo(5.0)
        }

        fulfillButton.snp.makeConstraints {
            $0.centerY.equalTo(secondSeparatorImageView)
            $0.leading.equalTo(secondSeparatorImageView.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(120.0)
        }
    }
}
