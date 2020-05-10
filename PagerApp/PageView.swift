//
//  PageView.swift
//  WaterUI
//
//  Created by Marcel Hagmann on 09.05.20.
//  Copyright © 2020 Marcel Hagmann. All rights reserved.
//

import UIKit

public class PageView: UIView {
    
    private var width:CGFloat = 0
    public var pages = [UIView]() {
        didSet {
            oldValue.forEach {
                $0.removeFromSuperview()
            }
            for index in 0..<pages.count {
                let page = pages[index]

                page.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(page)

                if index == 0 {
                    NSLayoutConstraint.activate(
                        [
                            page.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                            page.topAnchor.constraint(equalTo: contentView.topAnchor),
                            page.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                            page.widthAnchor.constraint(equalTo: contentView.widthAnchor)
                        ]
                    )
                } else {
                    let previousPage = pages[index-1]
                    
  
                    NSLayoutConstraint.activate(
                        [
                            page.leadingAnchor.constraint(equalTo: previousPage.trailingAnchor),
                            page.topAnchor.constraint(equalTo: contentView.topAnchor),
                            page.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                            page.widthAnchor.constraint(equalTo: contentView.widthAnchor)
                        ]
                    )
                }
            }
            updateWidth()
        }
        
    }
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.width = self.frame.size.width
        updateWidth()

    }
    
  
    // MARK: - Initializer

    public init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - View Setup

    private func updateWidth(){
        self.scrollView.contentSize.width = width * CGFloat(pages.count)

    }
    
    public func setupView() {
        addViews()
        setupConstraints()
    }

    private func addViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                scrollView.topAnchor.constraint(equalTo: topAnchor),
                scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ]
        )
    }
    

    // MARK: - Actions

    // MARK: - Subviews
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize = CGSize(width: self.frame.width, height: self.frame.height)
        view.isPagingEnabled = true
        return view
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red.withAlphaComponent(1)
        return view
    }()

}


