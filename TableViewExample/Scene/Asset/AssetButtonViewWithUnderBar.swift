//
//  AssetButtonViewWithUnderBar.swift
//  TableViewExample
//
//  Created by iMac on 2022/07/12.
//

import UIKit
import SnapKit

final class AssetButtonViewWithUnderBar: UIButton {

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("TEST", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.titleLabel?.font = .systemFont(ofSize: 16.0)
        return button
    }()

    private lazy var underBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    init(title: String) {
        super.init(frame: .zero)
        button.setTitle(title, for: .normal)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUnderBarColor() {
        underBarView.backgroundColor = .black
    }

    override var isSelected: Bool {
        didSet {
            button.setTitleColor(.black, for: .normal)
            underBarView.backgroundColor = .black
        }
    }

    

}

private extension AssetButtonViewWithUnderBar {
    func setupViews() {
        [
            button,
            underBarView
        ]
            .forEach {
                addSubview($0)
            }

        button.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }

        underBarView.snp.makeConstraints {
            $0.top.equalTo(button.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1.0)
            $0.bottom.equalToSuperview()
        }
    }
}
