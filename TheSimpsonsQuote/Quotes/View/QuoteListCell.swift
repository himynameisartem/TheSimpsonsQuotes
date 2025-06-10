//
//  QuoteListCell.swift
//  TheSimpsonsQuote
//
//  Created by Артем Кудрявцев on 09.06.2025.
//

import UIKit

struct QuoteListCellViewModel {
    let name: String
    let quote: String
    let imageName: String
}

class QuoteListCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let quoteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    let personImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: QuoteListCellViewModel) {
        loadingIndicator.startAnimating()
        personImage.image = nil
        nameLabel.text = viewModel.name
        quoteLabel.text = viewModel.quote
        let currentImage = viewModel.imageName
        
        DispatchQueue.global().async {
            guard let url = URL(string: viewModel.imageName),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data)
            else { return }
            
            DispatchQueue.main.async {
                if currentImage == viewModel.imageName {
                    self.loadingIndicator.stopAnimating()
                    self.personImage.image = image
                }
            }
        }
    }
    
    private func configureUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(quoteLabel)
        contentView.addSubview(personImage)
        contentView.addSubview(loadingIndicator)
        makeLeftChracterDirectionConstraints()
    }
    
    private func makeLeftChracterDirectionConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            quoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            quoteLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            quoteLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            personImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            personImage.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 10),
            personImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            personImage.widthAnchor.constraint(equalTo: personImage.heightAnchor),
            quoteLabel.trailingAnchor.constraint(equalTo: personImage.leadingAnchor, constant: -10),
            loadingIndicator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            loadingIndicator.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 10),
            loadingIndicator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            loadingIndicator.widthAnchor.constraint(equalTo: loadingIndicator.heightAnchor),
        ])
    }
}
