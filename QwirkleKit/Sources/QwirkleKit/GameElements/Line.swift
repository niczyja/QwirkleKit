//
//  Line.swift
//  
//
//  Created by Maciej Sienkiewicz on 17/07/2023.
//

import Foundation

/// Line of tiles that adheres to game rules. Creating invalid line will throw an error. Immutable.
public struct Line: Equatable, Hashable, Sendable {
    
    public static let maxLength = 6
    
    public let tiles: [Tile]
    
    public let score: Int
    
    public var isQwirkle: Bool {
        tiles.count == Line.maxLength // (or just score == 12)
    }
    
    public init(_ tiles: [Tile]) throws {
        guard let first = tiles.first, tiles.count <= Line.maxLength else {
            throw QwirkleError.invalidLineLength
        }
        
        guard (tiles.reduce(true) { $0 && first.isMatching($1) }) else {
            throw QwirkleError.tilesNotMatching
        }
        
        self.tiles = tiles
        self.score = tiles.count + (tiles.count == Line.maxLength ? 6 : 0)
    }
    
    public init(_ tile: Tile) throws {
        try self.init([tile])
    }
    
    public func isMatching(_ another: Line) -> Bool {
        self.tiles.first == another.tiles.first
    }
}
