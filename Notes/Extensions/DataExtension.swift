//
//  DataExtension.swift
//  Notes
//
//  Created by José Fernando Cristóbal Huerta on 30/09/23.
//

import Foundation

public extension Date {
    var iso8601String: String {
        Formatter.iso8601withFractionalSeconds.string(from: self)
    }
}
