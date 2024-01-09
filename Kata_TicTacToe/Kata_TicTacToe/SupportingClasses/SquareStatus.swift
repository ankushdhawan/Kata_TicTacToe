//
//  File.swift
//  Kata_TicTacToe
//
//  Created by Ankush Dhawan on 09/01/24.
//

import Foundation
enum SquareStatus {
    case empty
    case x
    case o
    
    func getLabelValue() ->String {
        switch self {
        case .empty:
            return ""
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }
}
