//
//  DetailViewController.swift
//  20220610-RussellAvila-NYCSchools
//
//  Created by Consultant on 6/9/22.
//

import UIKit

//Simple scrollview and labels.

class DetailViewController: UIViewController {

    lazy var schoolLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.accessibilityIdentifier = "SampleLabel"
        return label
    }()

    lazy var satMathLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.accessibilityIdentifier = "SampleLabel"
        return label
    }()
    
    lazy var satWritingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.accessibilityIdentifier = "SampleLabel"
        return label
    }()
    
    lazy var satReadingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.accessibilityIdentifier = "SampleLabel"
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
        }()
    
    lazy var contentView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setUpUI()
    }
    
    private func setUpUI() {
        
        let vStack = UIStackView(frame: .zero)
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.alignment = .center
        
        let topBuffer = UIView(resistancePriority: .defaultLow, huggingPriority: .defaultLow)
        let bottomBuffer = UIView(resistancePriority: .defaultLow, huggingPriority: .defaultLow)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(vStack)
        vStack.addArrangedSubview(topBuffer)
        vStack.addArrangedSubview(self.schoolLabel)
        vStack.addArrangedSubview(self.satReadingLabel)
        vStack.addArrangedSubview(self.satWritingLabel)
        vStack.addArrangedSubview(self.satMathLabel)
        vStack.addArrangedSubview(bottomBuffer)
        
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
                
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        vStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
                
        topBuffer.heightAnchor.constraint(equalTo: bottomBuffer.heightAnchor).isActive = true
    }
}
