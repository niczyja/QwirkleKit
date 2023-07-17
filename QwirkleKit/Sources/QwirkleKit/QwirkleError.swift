//
//  QwirkleError.swift
//  
//
//  Created by Maciej Sienkiewicz on 17/07/2023.
//

import Foundation

enum QwirkleError: Error {
    case notEnoughTiles
    case tileAlreadyThere
    case invalidLineLength
    case tilesNotMatching
}
