//
//  DaySelectorView.swift
//  PayUp
//
//  Created by Rafael on 25/12/25.
//

import UIKit

final class DaySelectorView: UIView {

    // MARK: - Delegates
    weak var delegate: DaySelectorViewDelegate?
    
    // MARK: - States
    private var days: [String] = []
    private var selectedIndex: Int = 0

    // MARK: - UI Components
    private var buttons: [UIButton] = []
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()

    // MARK: - Initializeds
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    internal func configure(days: [String], selectedIndex: Int) {
        self.days = days
        self.selectedIndex = selectedIndex
        setupButtons()
        updateSelection(index: getSelectedDay() ?? selectedIndex)
    }
    
    internal func getSelectedDay() -> Int? {
        return delegate?.selectedDay()
    }

    internal func setSelectedDay(_ day: Int) {
        delegate?.daySelectorView(self, didSelectDayAt: day)
    }
    
    // MARK: - Privates Methods
    private func setupButtons() {
        horizontalStackView.arrangedSubviews.forEach {$0.removeFromSuperview() }
        buttons.removeAll()
        
        for (index, day) in days.enumerated() {
            var attributedTitle = AttributedString(day)
            attributedTitle.font = Typography.headline()
            
            var configuration = UIButton.Configuration.filled()
            configuration.title = day
            configuration.baseBackgroundColor = Colors.backgroundSecondary
            configuration.baseForegroundColor = Colors.textHeading
            configuration.attributedTitle = attributedTitle
            configuration.cornerStyle = .fixed
            configuration.contentInsets = .zero
            
            let button = UIButton(configuration: configuration, primaryAction: nil)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 6
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.clear.cgColor
            button.titleLabel?.font = Typography.headline()
            button.heightAnchor.constraint(equalToConstant: 32).isActive = true
            button.widthAnchor.constraint(equalToConstant: 48).isActive = true
            button.tag = index
            button.addTarget(self, action: #selector(dayTapped(_:)), for: .touchUpInside)
            buttons.append(button)
            horizontalStackView.addArrangedSubview(button)
        }
    }
    
    private func updateSelection(index: Int) {
        for (i, button) in buttons.enumerated() {
            let isSelected = (i == index)
            button.configuration?.baseForegroundColor = isSelected ? Colors.accentBrand : Colors.textHeading
            button.layer.borderColor = isSelected ? Colors.accentBrand.cgColor : UIColor.clear.cgColor
        }
    }
    
    @objc private func dayTapped(_ sender: UIButton) {
        updateSelection(index: sender.tag)
        delegate?.daySelectorView(self, didSelectDayAt: sender.tag)
    }
}

// MARK: - Extension ViewCode Protocol
extension DaySelectorView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubviews(scrollView)
        scrollView.addSubviews(horizontalStackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            horizontalStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            horizontalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            horizontalStackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }

    func setupAdditionalConfiguration() {
        setupButtons()
        updateSelection(index: selectedIndex)
    }
}
