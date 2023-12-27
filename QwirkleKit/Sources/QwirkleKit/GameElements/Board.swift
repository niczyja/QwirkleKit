//
//  Board.swift
//  
//
//  Created by Maciej Sienkiewicz on 17/07/2023.
//

import Foundation

/// Board that keeps all tiles that were already laid out. Mutable.
public struct Board: Sendable {
    
    public static let side: Int = 20
    
    public private(set) var tiles: Array2D<Tile?> = .init(columns: Self.side, rows: Self.side, initialValue: nil)
    
    public init() {}
    
    public func canPlace(_ tile: Tile, at x: Int, _ y: Int) -> Bool {
        guard tiles[x, y] == nil else { return false }

        //TODO: najpierw prosta wersja, czyli sprawdzanie pojedynczego klocka czy pasuje do danej lokalizacji
        //TODO: trzeba się rozejrzeć w poziomie i pionie po planszy. rekrursywnie, bo mogą być kolejne sąsiadujące
        
//        let tileBefore = self.tile(at: x - 1, y)
//        let tileAfter = self.tile(at: x + 1, y)
//
//        guard try? Line([tileBefore, tile, tileAfter].compactMap({$0})) != nil else { return false }
        
        return true
    }

    private mutating func put(tile: Tile, at x: Int, _ y: Int) throws {
        guard tiles[x, y] == nil else { throw QwirkleError.tileAlreadyThere }

        tiles[x, y] = tile
    }
}
