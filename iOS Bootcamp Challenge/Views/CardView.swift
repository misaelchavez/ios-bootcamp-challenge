//
//  CardView.swift
//  iOS Bootcamp Challenge
//
//  Created by Marlon David Ruiz Arroyave on 28/09/21.
//

import UIKit

class CardView: UIView {

    private let margin: CGFloat = 30
    var card: Card?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var itemLabels: [(title: UILabel, description: UILabel)] = []

    required init(card: Card) {
        self.card = card
        super.init(frame: .zero)
        setup()
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupUI()
    }

    private func setup() {
        guard let card = card else { return }

        card.items.forEach { item in
            let titleLabel = UILabel()
            titleLabel.font = UIFont.boldSystemFont(ofSize: 13)
            titleLabel.textAlignment = .left
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.tintColor = UIColor.secondaryLabel
            titleLabel.text = item.title

            let descriptionLabel = UILabel()
            descriptionLabel.font = UIFont.systemFont(ofSize: 13)
            descriptionLabel.textAlignment = .left
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.text = item.description.capitalized

            itemLabels.append((title: titleLabel, description: descriptionLabel))
        }

        titleLabel.text = card.title

        backgroundColor = .white
        layer.cornerRadius = 20
    }

    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        titleLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.70).isActive = true

        var topAnchor = titleLabel.bottomAnchor
        itemLabels.forEach { itemTitleLabel, itemDescriptionLabel in
            addSubview(itemTitleLabel)
            itemTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: margin).isActive = true
            itemTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
            itemTitleLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.4).isActive = true

            addSubview(itemDescriptionLabel)
            itemDescriptionLabel.numberOfLines = 0
            itemDescriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: margin).isActive = true
            itemDescriptionLabel.leftAnchor.constraint(equalTo: itemTitleLabel.rightAnchor, constant: margin).isActive = true
            itemDescriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: margin).isActive = true

            topAnchor = itemDescriptionLabel.bottomAnchor
        }
    }

}
