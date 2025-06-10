//
//  ViewController.swift
//  TheSimpsonsQuote
//
//  Created by Артем Кудрявцев on 09.06.2025.
//

import UIKit

class QuotesViewController: UIViewController {
    
    let quoteListTable = UITableView()
    let refreshControl = UIRefreshControl()
    var quotes = [Quote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchQuotes()
    }
    
    private func fetchQuotes() {
        NetworkManager.shared.fetchData { [weak self] quotes in
            self?.quotes = quotes
            self?.quoteListTable.reloadData()
            self?.refreshControl.endRefreshing()
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        quoteListTable.dataSource = self
        quoteListTable.delegate = self
        quoteListTable.refreshControl = refreshControl
        quoteListTable.translatesAutoresizingMaskIntoConstraints = false
        quoteListTable.register(QuoteListCell.self, forCellReuseIdentifier: "quoteCell")
        view.addSubview(quoteListTable)
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            quoteListTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            quoteListTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            quoteListTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quoteListTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc private func refreshData() {
        fetchQuotes()
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension QuotesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as! QuoteListCell
        let quote = quotes[indexPath.row]
        let viewModel = QuoteListCellViewModel(name: quote.character, quote: quote.quote, imageName: quote.image)
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = quotes[indexPath.row]
        let details = Details(person: data.character, quote: data.quote, imageUrl: data.image)
        let destinatioonVC = DetailsViewController()
        destinatioonVC.details = details
        navigationController?.pushViewController(destinatioonVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}

