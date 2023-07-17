//
//  Board.swift
//  
//
//  Created by Maciej Sienkiewicz on 17/07/2023.
//

import Foundation

/// Board that keeps all tiles that were already laid out. Mutable.
public struct Board: Sendable {
    
    public static let side: Int = 100
    
    private var board: [Tile?] = .init(repeating: nil, count: Board.side * Board.side)
    
    public func tile(at x: Int, _ y: Int) -> Tile? {
        board[Self.side * y + x]
    }

    //TODO: I think we should only be able to put a Line
    public mutating func put(tile: Tile, at x: Int, _ y: Int) throws {
        guard self.tile(at: x, y) == nil else { throw QwirkleError.tileAlreadyThere }
        
        board[Self.side * y + x] = tile
    }
}
