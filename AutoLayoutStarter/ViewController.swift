//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white // superView
    view.addSubview(mainView) // subView
    makePurpleRectangle()
    makeBlueListStack()
    makeTwoOrangeBlock()
    setupLayout()
  }
  
  // Make purple rectangle at the bottom of mainView
  func makePurpleRectangle() {
    let purpleRectangle = UIView()
    purpleRectangle.backgroundColor = UIColor.purple
    mainView.addSubview(purpleRectangle)
    
    purpleRectangle.translatesAutoresizingMaskIntoConstraints = false
    purpleRectangle.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    purpleRectangle.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    purpleRectangle.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6).isActive = true
    purpleRectangle.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  // Make stack for blue lists at the center of mainview
  func makeBlueListStack() {
    // Make first bluebox
    let blueBox1 = UIView()
    blueBox1.heightAnchor.constraint(equalToConstant: 50).isActive = true
    blueBox1.widthAnchor.constraint(equalToConstant: 50).isActive = true
    blueBox1.backgroundColor = .blue
    blueBox1.translatesAutoresizingMaskIntoConstraints = false
    
    // Make second bluebox
    let blueBox2 = UIView()
    blueBox2.heightAnchor.constraint(equalToConstant: 50).isActive = true
    blueBox2.widthAnchor.constraint(equalToConstant: 50).isActive = true
    blueBox2.backgroundColor = .blue
    blueBox2.translatesAutoresizingMaskIntoConstraints = false
    
    // Make third bluebox
    let blueBox3 = UIView()
    blueBox3.heightAnchor.constraint(equalToConstant: 50).isActive = true
    blueBox3.widthAnchor.constraint(equalToConstant: 50).isActive = true
    blueBox3.backgroundColor = .blue
    blueBox3.translatesAutoresizingMaskIntoConstraints = false
    
    // Make a stackview for three boxes
    let stackView = UIStackView(arrangedSubviews: [blueBox1, blueBox2, blueBox3])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .equalCentering
    stackView.alignment = .center
    stackView.spacing = 0
    mainView.addSubview(stackView)
    
    // Set constraints for stackview
    stackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    stackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
    stackView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
    stackView.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
    stackView.heightAnchor.constraint(equalTo:mainView.heightAnchor, multiplier: 0.7).isActive = true
    stackView.widthAnchor.constraint(equalToConstant: 50).isActive = true
  }
    
  // Make two orange blocks
  func makeTwoOrangeBlock() {
    // Make left orange block
    let orangeBlock1 = UIView()
    orangeBlock1.backgroundColor = .orange
    orangeBlock1.heightAnchor.constraint(equalToConstant: 40).isActive = true
    orangeBlock1.widthAnchor.constraint(equalToConstant: 90).isActive = true
    orangeBlock1.translatesAutoresizingMaskIntoConstraints = false
    
    // Make right orange block
    let orangeBlock2 = UIView()
    orangeBlock2.backgroundColor = .orange
    orangeBlock2.heightAnchor.constraint(equalToConstant: 40).isActive = true
    orangeBlock2.widthAnchor.constraint(equalToConstant: 70).isActive = true
    orangeBlock2.translatesAutoresizingMaskIntoConstraints = false
    
    // Make a stackview for two orange blocks
    let stackView2 = UIStackView(arrangedSubviews: [orangeBlock1, orangeBlock2])
    stackView2.axis = .horizontal
    stackView2.backgroundColor = .red
    stackView2.alignment = .center
    stackView2.distribution = .fill
    stackView2.spacing = 10
    stackView2.translatesAutoresizingMaskIntoConstraints = false
    mainView.addSubview(stackView2)
    
    // Set constraints for stackview
    stackView2.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    stackView2.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    stackView2.heightAnchor.constraint(equalToConstant: 60).isActive = true
    stackView2.widthAnchor.constraint(equalToConstant: 250).isActive = true
    stackView2.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    stackView2.isLayoutMarginsRelativeArrangement = true

  }
    

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

