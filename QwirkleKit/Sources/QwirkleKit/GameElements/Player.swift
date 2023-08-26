//
//  Player.swift
//  
//
//  Created by Maciej Sienkiewicz on 17/07/2023.
//

import Foundation
import Algorithms

/// Player. Mutable.
public struct Player: Sendable {
    
    /// Tiles that player holds at hand. Immutable.
    public struct Hand: Sendable {

        public static let maxTiles: Int = 6

        public let tiles: [Tile]
        
        public var lines: Set<Line> {
            Set<Line>(tiles
                .permutations(ofCount: 1...Hand.maxTiles)
                //.combinations(ofCount: 1...Hand.maxTiles) i think permutations is the right one
                .compactMap { try? Line($0) })
        }
        
        public init(tiles: [Tile] = []) {
            self.tiles = tiles
        }
    }
    
    public let name: String
    
    public var score: Int = 0

    public var hand = Hand()
    
    public init(name: String) {
        self.name = name
    }
}
