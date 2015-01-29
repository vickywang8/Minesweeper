//
//  Buttons.swift
//  mw787_P8
//
//  Created by Minzhi Wang on 11/30/14.
//  Copyright (c) 2014 Minzhi Wang. All rights reserved.
//

import Foundation
import UIKit

class Buttons: UIButton {
    let buttonSize: CGFloat
    var button: Grid
    init (oneButton: Grid, buttonSize: CGFloat)
    {
        self.button = oneButton
        self.buttonSize = buttonSize
        let buttonFrame = CGRectMake(CGFloat(self.button.col)*buttonSize,CGFloat(self.button.row)*buttonSize,buttonSize,buttonSize)
        super.init(frame:buttonFrame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showText() -> String{
        if self.button.isMine{
            return "Boom"
        }
        else{
            if self.button.numOfNeighborMines==0 {
                return String(0)
            }
            else {
                return String(self.button.numOfNeighborMines)
            }
        }
    }
}
