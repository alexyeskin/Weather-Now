//
//  ForecastViewController.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    var output: ForecastViewOutput!
    
    let tableView = UITableView()
    
    var entity: ForecastEntity?
    
    private let cellReuseIdentifier = "ForecastCollectionViewCell"

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        output.viewIsReady()
    }
    
    // MARK: Config
    
    private func config() {
        configTableView()
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.allowsSelection = false
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func configViewForHeader(in section: Int) -> UIView? {
        guard let entity = entity else {
            return nil
        }
        
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.text = entity.days[section].dayTitle
        
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
        }
        
        return view
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let entity = entity else {
            return 0
        }
        
        return entity.days.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let entity = entity else {
            return 0
        }
        
        return entity.days[section].hours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? ForecastTableViewCell else {
            return UITableViewCell()
        }
        
        guard let entity = entity else {
            return UITableViewCell()
        }
        
        let hour = entity.days[indexPath.section].hours[indexPath.row]
        
        cell.iconImageView.image = UIImage(systemName: hour.imageName)?.withRenderingMode(.alwaysTemplate)
        cell.timeLabel.text = hour.stringDate
        cell.descriptionLabel.text = hour.description
        cell.temperatureLabel.text = "\(hour.temperature)°"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return configViewForHeader(in: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

// MARK: - ForecastViewInput

extension ForecastViewController: ForecastViewInput {
    func setupInitialState(entity: ForecastEntity) {
        self.entity = entity
        tableView.reloadData()
    }
}
