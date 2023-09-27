//
//  ViewController.swift
//  Clima
//
//  Created by CEMTREX on 26/09/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var currentLocationButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate=self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
        searchTextField.delegate=self
        weatherManager.delegate=self
        
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
        if let location=locations.last{
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            print("Latitude -> \(lat) Longitude -> \(lon)")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}



