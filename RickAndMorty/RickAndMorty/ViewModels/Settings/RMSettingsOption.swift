//
//  RMSettingsOption.swift
//  RickAndMorty
//
//  Created by CEMTREX on 28/11/23.
//

import UIKit

enum RMSettingsOption: CaseIterable {
    case rateApp
    case contactUs
    case terms
    case privacy
    case apiReference
    case viewSeries
    case viewCode

    var targetUrl: URL? {
        switch self {
        case .rateApp:
            return nil
        case .contactUs:
            return URL(string: "https://imgs.search.brave.com/yawudT3EeYZObtCwj8FD7eZiOIDNdtrik9A-3NZzp_w/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9j/b250YWN0LXVzLWNv/bW11bmljYXRpb24t/c3VwcG9ydC1zZXJ2/aWNlLWFzc2lzdGFu/Y2UtY29uY2VwdF81/Mzg3Ni0xMjgxMDMu/anBnP3NpemU9NjI2/JmV4dD1qcGc")
        case .terms:
            return URL(string: "https://imgs.search.brave.com/TQbFkDnenZjc_wJ0JLkFEJKR_hUkX5Mvme8kPz0j2fo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi90ZXJt/cy1zZXJ2aWNlLWJt/LXBocmFzZS1tYWRl/LW1ldGFsbGljLWxl/dHRlcnByZXNzLWJs/b2Nrcy1ibGFjay1w/ZXJmb3JhdGVkLXN1/cmZhY2UtODE5ODg0/NjYuanBn")
        case .privacy:
            return URL(string: "https://imgs.search.brave.com/Btev66A3o6UOwO5XR4N_-ugGX4BidZeVXlE9nenyncs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9wcml2/YWN5LXBvbGljeS1o/ZWFkaW5nLXByaW50/ZWQtdmludGFnZS10/eXBld3JpdGVyLTQz/MjM4NjY3LmpwZw")
        case .apiReference:
            return URL(string: "https://rickandmortyapi.com/documentation/#get-a-single-episode")
        case .viewSeries:
            return URL(string: "https://youtube.com/playlist?list=PLQl8zBB7bPvL6GycjAtAibVp6FsLWvMcY&si=YVqSitpQ8nJXYBkP")
        case .viewCode:
            return URL(string: "https://github.com/Unstopable18/Swift/tree/main/RickAndMorty")
        }
    }

    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contactUs:
            return "Contact Us"
        case .terms:
            return "Terms of Service"
        case .privacy:
            return "Privacy Policy"
        case .apiReference:
            return "API Reference"
        case .viewSeries:
            return "View VIdeo Series"
        case .viewCode:
            return "View App Code"
        }
    }

    var iconContainerColor: UIColor {
        switch self {
        case .rateApp:
            return .systemBlue
        case .contactUs:
            return .systemGreen
        case .terms:
            return .systemRed
        case .privacy:
            return .systemYellow
        case .apiReference:
            return .systemOrange
        case .viewSeries:
            return .systemPurple
        case .viewCode:
            return .systemPink
        }
    }

    var iconImage: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "star.fill")
        case .contactUs:
            return UIImage(systemName: "paperplane")
        case .terms:
            return UIImage(systemName: "doc")
        case .privacy:
            return UIImage(systemName: "lock")
        case .apiReference:
            return UIImage(systemName: "list.clipboard")
        case .viewSeries:
            return UIImage(systemName: "tv.fill")
        case .viewCode:
            return UIImage(systemName: "hammer.fill")
        }
    }
}

