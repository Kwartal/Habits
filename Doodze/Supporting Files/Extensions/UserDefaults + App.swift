//
//  UserDefaults + App.swift
//  Doodze
//
//  Created by Богдан Баринов on 08.11.2022.
//

import Foundation

extension UserDefaults {

    enum Key: String {
        case savedHabits


        static var clearableKeys: [Key] {
            [.savedHabits]
        }
    }

    static var isFirstLaunch: Bool {
        get { standard.value(forKey: #function) as? Bool ?? true }
        set { standard.setValue(newValue, forKey: #function) }
    }

    static var savedHabits: [BadHabit] {
        get { decode(for: .savedHabits) ?? [] }
        set { encode(value: newValue, for: .savedHabits) }
    }

    private static func encode<T: Encodable>(value: T?, for key: Key) {
        guard let value = value,
              let encoded = try? JSONEncoder().encode(value)
        else { return }

        standard.setValue(encoded, forKey: key.rawValue)
    }

    private static func decode<T: Decodable>(for key: Key) -> T? {
        guard let data = standard.value(forKey: key.rawValue) as? Data,
              let decoded = try? JSONDecoder().decode(T.self, from: data)
        else { return nil }

        return decoded
    }

}
