//
//  Bag.swift
//  
//
//  Created by Maciej Sienkiewicz on 17/07/2023.
//

import Foundation

/// A bag of tiles. Mutable.
public struct Bag: Sendable {
    
    public static let maxTiles: Int = 108
    
    private var tiles: [Tile]
    
    public var tilesLeft: Int {
        tiles.count
    }
    
    public init() {
        tiles = []
        let count = Bag.maxTiles / Tile.set.count
        for _ in 0..<count {
            tiles.append(contentsOf: Array(Tile.set))
        }
    }
    
    public mutating func draw() -> Tile? {
        guard let randomTile = tiles.randomElement() else { return nil }
        
        tiles.removeAll { $0 == randomTile }
        return randomTile
    }
    
    public mutating func draw(count: Int) -> [Tile] {
        var tiles: [Tile] = []
        for _ in 0..<count {
            guard let newTile = draw() else { break }
            tiles.append(newTile)
        }
        return tiles
    }
    
    public mutating func replace(tiles: [Tile]) throws -> [Tile] {
        guard tiles.count <= tilesLeft else { throw QwirkleError.notEnoughTiles }
        
        let newTiles = draw(count: tiles.count)
        self.tiles.append(contentsOf: tiles)
        return newTiles
    }
    
    public mutating func shuffle() {
        tiles.shuffle()
    }
    
    @discardableResult
    public mutating func empty() -> [Tile] {
        let allTiles = tiles
        tiles = []
        return allTiles
    }
}
