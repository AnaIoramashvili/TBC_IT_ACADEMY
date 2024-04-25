//
//  DetailViewModel.swift
//  Assignment19
//
//  Created by Ana on 4/24/24.
//

import UIKit

import UIKit

class DetailViewModel {
    
    // MARK: - Properties
    var flagImage: UIImage?
    var flagDescription: String?
    var regionName: String?
    var capitalName: String?
    var currencySymbol: String?
    var officialName: String?
    var googleMapsLink: String?
    var openStreetMapsLink: String?
    
    // MARK: - Initialization
    init(country: Country) {
        if let flags = country.flags {
            self.flagImage = UIImage(named: flags.png ?? "")
        } else {
            self.flagImage = nil
        }

        self.flagDescription = country.flags?.alt
        self.regionName = country.region
        self.capitalName = country.capital?.first
        
        if let currencies = country.currencies, let firstCurrencyKey = currencies.keys.first {
            if let currency = currencies[firstCurrencyKey] {
                self.currencySymbol = currency.symbol
            }
        }
        
        self.officialName = country.name?.official
        
        self.googleMapsLink = country.maps?.googleMaps
        self.openStreetMapsLink = country.maps?.openStreetMaps
    }
    
    // MARK: - Button Actions
    func openGoogleMaps() {
        if let googleMapsLink = googleMapsLink, let url = URL(string: googleMapsLink) {
            UIApplication.shared.open(url)
        }
    }
    
    func openOpenStreetMaps() {
        if let openStreetMapsLink = openStreetMapsLink, let url = URL(string: openStreetMapsLink) {
            UIApplication.shared.open(url)
        }
    }
}
