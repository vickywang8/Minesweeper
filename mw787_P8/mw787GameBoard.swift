//
//  GameBoard.swift
//  mw787_P8
//
//  Created by Minzhi Wang on 11/30/14.
//  Copyright (c) 2014 Minzhi Wang. All rights reserved.
//

import Foundation

class GameBoard{
    let size: Int
    var board: [[Grid]] = []
    init(size: Int)
    {
        self.size = size
        for a in 0..<size
        {
            var rows:[Grid] = []
            for b in 0..<size
            {
                var grid = Grid(row: a, col: b)
                rows.append(grid)
            }
            board.append(rows)
        }
        
    }
    
    func reset(){
        for a in 0..<size {
            for b in 0..<size {
                board[a][b].isClicked = false
                self.resetMines(board[a][b])
            }
        }
        
        for a in 0..<size {
            for b in 0..<size {
                self.findNeighborMines(board[a][b])
            }
        }
    }
    
    func resetMines(grid: Grid){
        if ((arc4random_uniform(10)+1) == 2)
        {
            grid.isMine = true
        }
        else
        {
            grid.isMine = false
        }
    }
    
    func findNeighborMines(grid: Grid){
        let neighbors = getNeighbors(grid)
        var numOfNeighborMines = 0
        for a in neighbors{
            if a.isMine {
                numOfNeighborMines = numOfNeighborMines + 1
            }
        }
        grid.numOfNeighborMines = numOfNeighborMines
    }
    
    func getNeighbors(grid: Grid) -> [Grid]{
        var neighbors:[Grid] = []
        let thelist = [(-1,-1),(0,-1),(1,-1),(-1,0),(0,0),(1,0),(-1,1),(0,1),(1,1)]
        for (a,b) in thelist
        {
            if ((grid.row+a >= 0) && (grid.col+b >= 0) && (grid.row+a < self.size) && (grid.col+b < self.size))
            {
                var aNeighbor: Grid = board[grid.row+a][grid.col+b]
                neighbors.append(aNeighbor)
            }
            
        }
        return neighbors
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
