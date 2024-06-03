//
//  ItemProfile.swift
//  DZ_2_modul3
//
//  Created by Nikita Shipovskiy on 31/05/2024.
//

import Foundation


struct ItemProfile {
    
    var id = UUID().uuidString
    var name: String
    
    static func makeData() -> [ItemProfile] {
        [
        ItemProfile(name: "Настройки"),
        ItemProfile(name: "Чат с поддержкой"),
        ItemProfile(name: "О приложении")
        ]
    }
}
