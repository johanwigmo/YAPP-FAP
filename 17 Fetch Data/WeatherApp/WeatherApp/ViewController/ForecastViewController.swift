//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import UIKit
import MessageUI

class ForecastViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var city: City?
    
    private var dataProvider: ForecastDataProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        
        dataProvider = ForecastDataProvider()
        
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        tableView.register(ForecastCell.getNib(), forCellReuseIdentifier: ForecastCell.identifier)

        guard let city = city else {
            return
        }
        
        title = city.name
        
        ApiManager.shared.forecast.fetch(id: city.id, success: { (forecasts) in
            self.dataProvider?.viewModels = self.createForecastViewModels(from: forecasts)
            
            self.tableView.reloadData()
            
        }, failure: { (error) in
            print(error.localizedDescription)
        })
        
    }
    
    private func createForecastViewModels(from forecasts: [Forecast]) -> [ForecastViewModel] {
        var viewModels = [ForecastViewModel]()
        
        for forecast in forecasts {
            if let index = viewModels.firstIndex(where: { $0.day == forecast.timestamp.formattedDay() }) {
                viewModels[index].forecasts.append(forecast)
            } else {
                viewModels.append(ForecastViewModel(day: forecast.timestamp.formattedDay(), forecasts: [forecast]))
            }
        }
        
        return viewModels
    }
    
    
    private func addBackground() {
        view.insertSubview(ViewFactory.background(to: view), at: 0)
    }
    
    @IBAction func mail(_ sender: Any) {
        guard MFMailComposeViewController.canSendMail() else {
            print("Can not send mail")
            return
        }
        
        guard let city = city, let weather = city.weather?.first?.description else { return }
        
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = self
        
        vc.setSubject("Weather in \(city.name)")
        vc.setMessageBody(weather, isHTML: false)
        
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func share(_ sender: Any) {
        guard let city = city,
            let weather = city.weather?.first?.description,
            let icon = city.weather?.first?.iconImage else { return }
        
        let text = city.name + " - " + weather
        
        let vc = UIActivityViewController(activityItems: [text, icon], applicationActivities: nil)
        vc.excludedActivityTypes = [
            .postToFacebook
        ]
        
        present(vc, animated: true, completion: nil)
    }
    
}

extension ForecastViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case .failed:
            print("Something went wrong")
        default: break
        }
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
}
