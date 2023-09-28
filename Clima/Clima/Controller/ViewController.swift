//
//  ViewController.swift
//  Clima
//
//  Created by CEMTREX on 26/09/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    
//    var startTime: Date?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationAuthorizationStatus()
//        startTime = Date()
        
        searchTextField.delegate=self
        weatherManager.delegate=self
        
    }
    
    @IBAction func locationButtonPressed(_ sender: Any) {
//        startTime = Date()
        checkLocationAuthorizationStatus()
    }
    
    func checkLocationAuthorizationStatus() {
        let status = locationManager.authorizationStatus
        
        switch status {
                
        case .authorizedAlways, .authorizedWhenInUse:
//            print(".authorizedAlways, .authorizedWhenInUse")
            startLocationUpdates()
                
        case .notDetermined:
//            print(".notDetermined")

            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
                
        case .denied, .restricted:
//            print(".denied, .restricted")
            print("Location services denied or restricted.")
                
        @unknown default:
            fatalError("A new case for CLLocationManager.authorizationStatus() is available.")
        }
    }

    func startLocationUpdates() {
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
}

// MARK: - UITextFieldDelegate

extension ViewController:UITextFieldDelegate{
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" { 
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchTextField.endEditing(true)
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city=searchTextField.text{
            weatherManager.fetchWeather(cityname: city)
        }
        searchTextField.text = ""
        
    }
    
}

// MARK: - WeatherManagerDelegate

extension ViewController:WeatherManagerDelegate{
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.weatherImage.image = UIImage(systemName: weather.conditionName)
            self.locationLabel.text = weather.cityName
        }
    }
        
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

// MARK: - CLLocationManagerDelegate

extension ViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let startTime = self.startTime {
//            let timeTaken = Date().timeIntervalSince(startTime)
//            print("Time taken to get location: \(timeTaken) seconds")
//        }
        if let location=locations.last{
            
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
//            print("Latitude -> \(lat) Longitude -> \(lon)")
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .authorizedAlways || status == .authorizedWhenInUse {
                startLocationUpdates()
            } else {
                print("Location authorization status changed to \(status.rawValue)")
            }
        }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}



