//
//  Habit.swift
//  Doodze
//
//  Created by Богдан Баринов on 07.11.2022.
//

import Foundation

struct Habit: Codable, Equatable, Hashable {
    let name: String
    let imageName: String
    let description: String

    init(name: String, imageName: String, description: String) {
        self.name = name
        self.imageName = imageName
        self.description = description
    }
}



