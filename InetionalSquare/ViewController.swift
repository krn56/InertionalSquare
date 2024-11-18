//
//  ViewController.swift
//  InetionalSquare
//
//  Created by Роман Крендясов on 18.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var squareView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 8
        view.frame = .init(origin: view.center, size: CGSize(width: 100, height: 100))
        return view
    }()
    
    private lazy var dynamicAnimator = UIDynamicAnimator(referenceView: view)
    private lazy var snapBehavior = UISnapBehavior(item: squareView, snapTo: view.center)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(squareView)
        dynamicAnimator.addBehavior(snapBehavior)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchCoordinates = touches.first?.location(in: view) else { return }
        snapBehavior.snapPoint = touchCoordinates
    }
}

#Preview {
    ViewController()
}
