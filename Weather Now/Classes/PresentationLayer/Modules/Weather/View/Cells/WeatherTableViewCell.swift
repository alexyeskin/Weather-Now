//
//  WeatherCollectionViewCell.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    let iconImageView = UIImageView()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config() {
        configImageView()
        configLabel()
    }
    
    private func configImageView() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .orange
        addSubview(iconImageView)
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(40)
        }
    }
    
    private func configLabel() {
        descriptionLabel.font = .systemFont(ofSize: 17)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .black
        addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(5)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
