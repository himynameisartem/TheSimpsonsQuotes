//
//  DetailsViewController.swift
//  TheSimpsonsQuote
//
//  Created by Артем Кудрявцев on 10.06.2025.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var details: Details?
    
    let personImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let quoteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(personImage)
        view.addSubview(nameLabel)
        view.addSubview(quoteLabel)
        makeConstraints()
        
        guard let details = details else { return }
        nameLabel.text = details.person
        quoteLabel.text = details.quote
        DispatchQueue.global().async {
            guard
                let url = URL(string: details.imageUrl),
                let imageData = try? Data(contentsOf: url)
            else { return }
            DispatchQueue.main.async {
                self.personImage.image = UIImage(data: imageData)
            }
        }

        
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            personImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            personImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            personImage.heightAnchor.constraint(equalToConstant: view.frame.height / 3),
            nameLabel.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            quoteLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            quoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            quoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
