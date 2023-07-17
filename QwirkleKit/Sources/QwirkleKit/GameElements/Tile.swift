//
//  Tile.swift
//  
//
//  Created by Maciej Sienkiewicz on 17/07/2023.
//

import Foundation

/// Representation of a tile with given shape and color. Immutable.
public struct Tile: Equatable, Hashable, Sendable {

    ///Shapes: ● ✦ ◆ ◼︎ ✷ ✤
    public enum Shape: CaseIterable, Sendable {
        case circle, sparkle, diamond, square, star, clover
    }
    
    public enum Color: CaseIterable, Sendable {
        case red, orange, yellow, green, blue, purple
    }
    
    public static let set: Set<Tile> = {
        var set = Set<Tile>()
        for shape in Shape.allCases {
            for color in Color.allCases {
                set.insert(Tile(color, shape))
            }
        }
        return set
    }()

    public let color: Color
    
    public let shape: Shape
    
    public init(_ color: Color, _ shape: Shape) {
        self.color = color
        self.shape = shape
    }
    
    public func isMatching(_ another: Tile) -> Bool {
        self != another && (self.shape == another.shape || self.color == another.color)
    }
}
