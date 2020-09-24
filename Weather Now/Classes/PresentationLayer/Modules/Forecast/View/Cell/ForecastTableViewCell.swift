//
//  ForecastTableViewCell.swift
//  Weather Now
//
//  Created by Alexander Eskin on 24.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    let iconImageView = UIImageView()
    let stackView = UIStackView()
    let timeLabel = UILabel()
    let descriptionLabel = UILabel()
    let temperatureLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Config
    
    private func config() {
        configIconImageView()
        configStackView()
        configTimeLabel()
        configDescriptionLabel()
        configTemperatureLabel()
    }
    
    private func configIconImageView() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .orange
        
        addSubview(iconImageView)
        
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
            make.width.height.equalTo(50)
        }
    }
    
    private func configStackView() {
        stackView.axis = .vertical
        stackView.spacing = 5
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(iconImageView.snp.right).offset(30)
        }
    }
    
    private func configTimeLabel() {
        timeLabel.font = .systemFont(ofSize: 14)
        timeLabel.textAlignment = .center
        timeLabel.textColor = .black
        
        stackView.addArrangedSubview(timeLabel)
    }
    
    private func configDescriptionLabel() {
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .black
        
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    private func configTemperatureLabel() {
        temperatureLabel.font = .systemFont(ofSize: 40, weight: .bold)
        temperatureLabel.textAlignment = .right
        temperatureLabel.textColor = .blue
        
        addSubview(temperatureLabel)
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.bottom.equalTo(-16)
            make.right.equalTo(-20)
            make.left.greaterThanOrEqualTo(stackView.snp.right).offset(16)
        }
    }
}
