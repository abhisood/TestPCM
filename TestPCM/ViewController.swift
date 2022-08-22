//
//  ViewController.swift
//  TestPCM
//
//  Created by Abhishek Sood on 8/21/22.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    let visitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Visit site", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let eventAttributionView = UIEventAttributionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        visitButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(visitButton)
        // eventAttributionView.layer.zPosition = 1000 -> Don't set
        eventAttributionView.translatesAutoresizingMaskIntoConstraints = false
        eventAttributionView.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        view.addSubview(eventAttributionView)
        
        
        NSLayoutConstraint.activate([
            visitButton.widthAnchor.constraint(equalToConstant: 250),
            visitButton.heightAnchor.constraint(equalToConstant: 50),
            visitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            visitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            eventAttributionView.widthAnchor.constraint(equalToConstant: 250),
            eventAttributionView.heightAnchor.constraint(equalToConstant: 50),
            eventAttributionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            eventAttributionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc
    func buttonTapped() {
        openWebsite(URL(string: "https://en.wikipedia.org/wiki/Bit")!)
    }
    
    func openWebsite(_ url: URL) {
        let eventAttribution = UIEventAttribution(sourceIdentifier: 101, destinationURL: url, sourceDescription: "test-event-attribution", purchaser: "test-app")
        
        let config = SFSafariViewController.Configuration()
        config.eventAttribution = eventAttribution
        config.barCollapsingEnabled = true
        
        let svc = SFSafariViewController(url: url, configuration: config)
        present(svc, animated: true)
    }
}

