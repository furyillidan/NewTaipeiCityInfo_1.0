//
//  PriceMapViewController.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/9/25.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class PriceMapViewController: UIViewController {
    
    var locationManager : CLLocationManager!
    var Annotation : MKAnnotation!
    var addresData = ""
    
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        myMapView.delegate = self
        myMapView.mapType = .standard
        myMapView.showsUserLocation = true
        myMapView.isZoomEnabled = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            fallthrough
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .denied:
            NTAlertManager.sharedInstance.callAlertView(alertTitle: "定位權限已關閉", alertMessage: "如要變更權限,請至 設定 > 隱私權 > 定位服務 開啟", actionTitle: "確認", view: self)
        default:
            break
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        locationManager.stopUpdatingLocation()
    }
    
 
    @IBAction func priceMapBackBtn(_ sender: Any) {
            self.dismiss(animated: true, completion: nil)
    }
 
    @IBAction func goToGMap (_ sender : Any) {
        
        let alert = UIAlertController(title: "將為您開啟googleMap", message: "", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "返回", style: .default, handler: nil))
               let settings = UIAlertAction(title: "開啟", style: .default) { (action) in

                let addressString = UserDefaults.standard.value(forKey: "address") as! String
                let address = addressString.fromSubString(from: 4)
                   let urlString = "https://www.google.com/maps/search/?api=1&query=" + "\(address)"
                   let decodeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                   let url = URL(string: decodeUrlString!)

                   UIApplication.shared.open( url! , options: [:], completionHandler: nil)
               }
               alert.addAction(settings)
               self.present(alert, animated: true, completion: nil)
    }

    @IBAction func whereAmIBtn(_ sender: Any) {
        locationManager.startUpdatingLocation()
    }
    
    
//    func addAnnotations(latitude: Double?, longitude: Double?) {
//        let pointAnnotation = MKPointAnnotation()
//        pointAnnotation.coordinate = CLLocationCoordinate2DMake(latitude ?? 0.0, longitude ?? 0.0)
//        pointAnnotation.title = "You Are here"
//        pointAnnotation.subtitle = "Try Not To Get Lost"
//        self.myMapView.addAnnotation(pointAnnotation)
//
//    }
    
    
    
    func getGasCompanyLatitudeAndLongitude (address: String?) {
        
        let geoCoder = CLGeocoder()
               geoCoder.geocodeAddressString(address!) { (placemarks, error) in
                   if error != nil {
                       print(error as Any)
                       return
                   }
                   
                   if placemarks != nil && placemarks!.count > 0 {
                       let placemark = placemarks![0] as CLPlacemark
                       print(placemark)
                       
                   }
            }
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = UITouch()
        let point = touch.location(in: self.myMapView)
        
        let coordinate = self.myMapView.convert(point, toCoordinateFrom: self.myMapView)
        
      
        
        
    }
    
}

extension PriceMapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let currentLocation: CLLocation = locations[0] as CLLocation
        print("\(currentLocation.coordinate.latitude)")
        print("\(currentLocation.coordinate.longitude)")
        
        let center = CLLocationCoordinate2DMake(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude)
        
        let regin = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//        self.addAnnotations(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
//
        myMapView.setRegion(regin, animated: true)
    }
    
}

extension PriceMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 4
        return renderer
    }
}


