//
//  ViewController.swift
//  iOSDev
//
//  Created by Камиль Байдиев on 17.01.2024.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func setLabelText(text: String)
    func setTitle(title: String)
}

class MainViewController: UIViewController, ViewControllerDelegate {
    func setLabelText(text: String) {
        self.nameSurnameLabel.text = text
    }
    
    func setTitle(title: String) {
        
    }
    
    lazy var profileImage: UIImageView = {
        $0.image = UIImage(named: "profileImage")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 50
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var nameSurnameLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Имя Фамилия"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        return $0
    }(UILabel())
    
    lazy var settingsBtnLabel: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        $0.setTitle("Настройки", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.addTarget(self, action: #selector(settingsBtnLabelTapped), for: .touchUpInside)
        return $0
    }(UIButton())
    
    lazy var stackViewContainer: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 20
        return $0
    }(UIStackView())
    
    lazy var someViewLeft: UIView = {
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        $0.layer.cornerRadius = 10
        return $0
    }(UIView())
    
    lazy var friendsCountStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 5
        return $0
    }(UIStackView())
    
    lazy var friendsCountLabel: UILabel = {
        $0.text = "10"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        return $0
    }(UILabel())
    
    lazy var friendsCountTxtLabel: UILabel = {
        $0.text = "Друзей"
        return $0
    }(UILabel())
    
    lazy var someViewInCenter: UIView = {
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        $0.layer.cornerRadius = 10
        return $0
    }(UIView())
    
    lazy var subsCountStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 5
        return $0
    }(UIStackView())
    
    lazy var subsCountLabel: UILabel = {
        $0.text = "20"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        return $0
    }(UILabel())
    
    lazy var subsCountTxtLabel: UILabel = {
        $0.text = "Подписок"
        return $0
    }(UILabel())
    
    lazy var someViewRight: UIView = {
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        $0.layer.cornerRadius = 10
        return $0
    }(UIView())
    
    lazy var favoriteCountStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 5
        return $0
    }(UIStackView())
    
    lazy var favoriteCountLabel: UILabel = {
        $0.text = "30"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        return $0
    }(UILabel())
    
    lazy var favoriteCountTxtLabel: UILabel = {
        $0.text = "Избранных"
        $0.font = UIFont.systemFont(ofSize: 16)
        return $0
    }(UILabel())
    
    lazy var imageView: UIImageView = {
        $0.image = UIImage(named: "Image")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        stackViewContainer.distribution = .fillEqually

        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(profileImage)
        view.addSubview(nameSurnameLabel)
        view.addSubview(settingsBtnLabel)
        view.addSubview(stackViewContainer)
        stackViewContainer.addArrangedSubview(someViewLeft)
        someViewLeft.addSubview(friendsCountStackView)
        stackViewContainer.addArrangedSubview(someViewInCenter)
        someViewInCenter.addSubview(subsCountStackView)
        stackViewContainer.addArrangedSubview(someViewRight)
        someViewRight.addSubview(favoriteCountStackView)
        view.addSubview(imageView)
        
        friendsCountStackView.addArrangedSubview(friendsCountLabel)
        friendsCountStackView.addArrangedSubview(friendsCountTxtLabel)
        
        subsCountStackView.addArrangedSubview(subsCountLabel)
        subsCountStackView.addArrangedSubview(subsCountTxtLabel)
        
        favoriteCountStackView.addArrangedSubview(favoriteCountLabel)
        favoriteCountStackView.addArrangedSubview(favoriteCountTxtLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Констрейнты для profileImage
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            
            // Констрейнты для nameSurnameLabel
            nameSurnameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: -10),
            nameSurnameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameSurnameLabel.widthAnchor.constraint(equalToConstant: 300),
            nameSurnameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            // Констрейнты для settingsBtnLabel
            settingsBtnLabel.topAnchor.constraint(equalTo: nameSurnameLabel.bottomAnchor, constant: 0),
            settingsBtnLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingsBtnLabel.widthAnchor.constraint(equalToConstant: 86),
            settingsBtnLabel.heightAnchor.constraint(equalToConstant: 19),
            
            // Констрейнты для stackViewContainer
            stackViewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewContainer.topAnchor.constraint(equalTo: settingsBtnLabel.bottomAnchor, constant: 20),
            stackViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackViewContainer.heightAnchor.constraint(equalToConstant: 80),
          
            // Констрейнты для imageView
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: stackViewContainer.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 332),

            // Констрейнты для friendsCountStackView
            friendsCountStackView.leadingAnchor.constraint(equalTo: someViewLeft.leadingAnchor, constant: 10),
            friendsCountStackView.topAnchor.constraint(equalTo: someViewLeft.topAnchor, constant: 10),
            friendsCountStackView.trailingAnchor.constraint(equalTo: someViewLeft.trailingAnchor, constant: -10),
            
            // Констрейнты для subsCountStackView
            subsCountStackView.leadingAnchor.constraint(equalTo: someViewInCenter.leadingAnchor, constant: 10),
            subsCountStackView.topAnchor.constraint(equalTo: someViewInCenter.topAnchor, constant: 10),
            subsCountStackView.trailingAnchor.constraint(equalTo: someViewInCenter.trailingAnchor, constant: -10),
            
            // Констрейнты для favoriteCountStackView
            favoriteCountStackView.leadingAnchor.constraint(equalTo: someViewRight.leadingAnchor, constant: 10),
            favoriteCountStackView.topAnchor.constraint(equalTo: someViewRight.topAnchor, constant: 10),
            favoriteCountStackView.trailingAnchor.constraint(equalTo: someViewRight.trailingAnchor),
        ])
    }
    
    @objc func settingsBtnLabelTapped() {
        let settingsVC = SettingsViewController()
        settingsVC.delegate = self
        print("123123")
        navigationController?.pushViewController(settingsVC, animated: true)
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func updateProfileData(name: String, surname: String) {
        nameSurnameLabel.text = "\(name) \(surname)"
    }
}
