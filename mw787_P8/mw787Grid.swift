//
//  Grid.swift
//  mw787_P8
//
//  Created by Minzhi Wang on 11/30/14.
//  Copyright (c) 2014 Minzhi Wang. All rights reserved.
//

import Foundation

class Grid {
    let row: Int
    let col: Int
    
    var numOfNeighborMines = 0
    var isMine = false
    var isClicked = false
    
    init(row: Int,col:Int)
    {
        self.row = row
        self.col = col
    }
}
