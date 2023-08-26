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
        board[idx(x, y)]
    }
    
    public func canPlace(_ tile: Tile, at x: Int, _ y: Int) -> Bool {
        guard self.tile(at: x, y) == nil else { return false }

        //TODO: najpierw prosta wersja, czyli sprawdzanie pojedynczego klocka czy pasuje do danej lokalizacji
        //TODO: trzeba się rozejrzeć w poziomie i pionie po planszy. rekrursywnie, bo mogą być kolejne sąsiadujące
        
//        let tileBefore = self.tile(at: x - 1, y)
//        let tileAfter = self.tile(at: x + 1, y)
//
//        guard try? Line([tileBefore, tile, tileAfter].compactMap({$0})) != nil else { return false }
        
        return true
    }

    private mutating func put(tile: Tile, at x: Int, _ y: Int) throws {
        guard self.tile(at: x, y) == nil else { throw QwirkleError.tileAlreadyThere }

        board[idx(x, y)] = tile
    }

    private func idx(_ x: Int, _ y: Int) -> Int {
        Self.side * y + x
    }
}
