//
//  SettingsItem.swift
//  NavigationFlow
//
//  Created by Javier Cueto on 18/12/23.
//

struct SettingsItem {
    let title: String
    let isSelected: Bool
    let navigateTo: SettingsNavigation
}

enum SettingsNavigation {
    case login
    case profile
}
