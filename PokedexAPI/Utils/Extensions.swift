//
//  Extensions.swift
//  PokedexAPI
//
//  Created by Diplomado on 15/06/24.
//

import UIKit

extension UIView {
    static var name: String { String(describing: Self.self) }
}

extension UIViewController {
    func presentErrorAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}

extension Data {
    init(from object: Encodable) throws {
        self = try JSONEncoder().encode(object)
    }
}

extension Decodable {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Self.self, from: data)
    }
}

extension UserDefaults {
    func get<T: Decodable & ExpressibleByNilLiteral>(for key: String) throws -> T {
        guard let data = data(forKey: key) else { return nil }
        return try T(data: data)
    }
    
    func set(object: Encodable, for key: String) throws {
        let data = try Data(from: object)
        set(data, forKey: key)
    }
}
