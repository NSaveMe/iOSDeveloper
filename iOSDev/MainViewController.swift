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
        let image = UIImageView(image: UIImage(named: "profileImage"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        return image
    }()
    
    lazy var nameSurnameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Имя Фамилия"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var settingsBtnLabel: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitle("Настройки", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(settingsBtnLabelTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        return stackView
    }()
    
    lazy var someViewLeft: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var friendsCountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var friendsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "10"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var friendsCountTxtLabel: UILabel = {
        let label = UILabel()
        label.text = "Друзей"
        return label
    }()
    
    lazy var someViewInCenter: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var subsCountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var subsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "20"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var subsCountTxtLabel: UILabel = {
        let label = UILabel()
        label.text = "Подписок"
        return label
    }()
    
    lazy var someViewRight: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var favoriteCountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var favoriteCountLabel: UILabel = {
        let label = UILabel()
        label.text = "30"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var favoriteCountTxtLabel: UILabel = {
        let label = UILabel()
        label.text = "Избранных"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Image"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
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
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            
            // Констрейнты для nameSurnameLabel
            nameSurnameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: -10),
            nameSurnameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameSurnameLabel.widthAnchor.constraint(equalToConstant: 300),
            nameSurnameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            // Констрейнты для settingsBtnLabel
            settingsBtnLabel.topAnchor.constraint(equalTo: nameSurnameLabel.bottomAnchor, constant: -10),
            settingsBtnLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingsBtnLabel.widthAnchor.constraint(equalToConstant: 86),
            settingsBtnLabel.heightAnchor.constraint(equalToConstant: 19),
            
            // Констрейнты для stackViewContainer
            stackViewContainer.topAnchor.constraint(equalTo: settingsBtnLabel.bottomAnchor, constant: 10),
            stackViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackViewContainer.heightAnchor.constraint(equalToConstant: 80),
            stackViewContainer.widthAnchor.constraint(equalTo: stackViewContainer.heightAnchor, multiplier: 2.0),

            // Констрейнты для imageView
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: stackViewContainer.bottomAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 369),
            imageView.heightAnchor.constraint(equalToConstant: 332),

//            stackViewContainer.topAnchor.constraint(equalTo: settingsBtnLabel.bottomAnchor, constant: 10),
//            stackViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            stackViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//
//            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imageView.topAnchor.constraint(equalTo: subsCountTxtLabel.bottomAnchor, constant: 20),
//            imageView.widthAnchor.constraint(equalToConstant: 369),
//            imageView.heightAnchor.constraint(equalToConstant: 332),
            
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
            favoriteCountStackView.trailingAnchor.constraint(equalTo: someViewRight.trailingAnchor, constant: -10),
        ])
    }
    
    @objc func settingsBtnLabelTapped() {
        let settingsVC = SettingsViewController()
        settingsVC.delegate = self
        navigationController?.pushViewController(settingsVC, animated: true)
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func updateProfileData(name: String, surname: String) {
        nameSurnameLabel.text = "\(name) \(surname)"
    }
}
