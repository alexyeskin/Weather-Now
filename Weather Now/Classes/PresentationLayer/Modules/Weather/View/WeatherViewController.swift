//
//  WeatherViewController.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import SnapKit
import UIKit

class WeatherViewController: UIViewController {
    var output: WeatherViewOutput!
    
    let weatherImageView = UIImageView()
    let locationLabel = UILabel()
    let temperatureLabel = UILabel()
    let shareButton = UIButton(type: .system)
    var collectionView: UICollectionView?
    
    var entity: WeatherEntity?
    
    private let cellReuseIdentifier = "WeatherCollectionViewCell"

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        output.viewIsReady()
    }
    
    // MARK: Config
    
    private func config() {
        configWeatherImageView()
        configLocationLabel()
        configTemperatureLabel()
        configShareButton()
        configCollectionView()
    }
    
    private func configWeatherImageView() {
        weatherImageView.contentMode = .scaleAspectFit
        weatherImageView.tintColor = .orange
        view.addSubview(weatherImageView)
        
        weatherImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(35)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    private func configLocationLabel() {
        locationLabel.font = .systemFont(ofSize: 19)
        locationLabel.textColor = .black
        locationLabel.textAlignment = .center
        view.addSubview(locationLabel)
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
        }
    }
    
    private func configTemperatureLabel() {
        temperatureLabel.font = .systemFont(ofSize: 26, weight: .medium)
        temperatureLabel.textColor = .blue
        temperatureLabel.textAlignment = .center
        view.addSubview(temperatureLabel)
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
        }
    }
    
    private func configCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 10, left: 50, bottom: 10, right: 50)
        collectionViewLayout.itemSize = CGSize(width: 100, height: 100)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        
        if let collectionView = collectionView {
            view.addSubview(collectionView)
        }
        
        collectionView?.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(temperatureLabel.snp.bottom).offset(25)
            make.bottom.equalTo(shareButton.snp.top).offset(-10)
        }
    }
    
    private func configShareButton() {
        shareButton.tintColor = .red
        shareButton.setTitle("Share", for: .normal)
        shareButton.addTarget(self, action: #selector(actionShare), for: .touchUpInside)
        view.addSubview(shareButton)
        
        shareButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(1.7)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(30)
        }
    }
    
    // MARK: Action
    
    @objc
    func actionShare() {
        if let entity = entity {
            output.actionShare(entity: entity)
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entity?.additionalInfo.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellReuseIdentifier,
            for: indexPath
            ) as? WeatherCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let info = entity?.additionalInfo[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        cell.descriptionLabel.text = info.text
        cell.iconImageView.image = UIImage(systemName: info.imageName)?.withRenderingMode(.alwaysTemplate)
        
        return cell
    }
}

// MARK: - WeatherViewInput

extension WeatherViewController: WeatherViewInput {
    func setupInitialState(entity: WeatherEntity) {
        self.entity = entity
        collectionView?.reloadData()
        locationLabel.text = "\(entity.city), \(entity.country)"
        temperatureLabel.text = "\(entity.temperature)°C | \(entity.description)"
        weatherImageView.image = UIImage(systemName: entity.imageName)?.withRenderingMode(.alwaysTemplate)
    }
}
