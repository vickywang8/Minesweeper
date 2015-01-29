//
//  ViewController.swift
//  mw787_P8
//
//  Created by Minzhi Wang on 11/30/14.
//  Copyright (c) 2014 Minzhi Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gridView: UIView!
       
    @IBOutlet weak var aview: UIView!
    
    let boardSize: Int = 8
    var gameBoard: GameBoard
    var buttons: [Buttons] = []
    
    required init(coder aDecoder: NSCoder) {
        self.gameBoard = GameBoard(size: boardSize)
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    
    func initialize() {
        for row in 0 ..< gameBoard.size {
            for col in 0 ..< gameBoard.size {
                
                let grid = gameBoard.board[row][col]
                
                let gridSize:CGFloat = self.gridView.frame.width / CGFloat(8)
                
                let oneButton = Buttons(oneButton: grid, buttonSize: gridSize)
                oneButton.setTitle("*", forState: .Normal)
                oneButton.addTarget(self, action: "buttonsPressed:", forControlEvents: .TouchUpInside)
                self.buttons.append(oneButton)
                self.gridView.addSubview(oneButton)
            }
        }
    }
    
    func reset(){
        self.gameBoard.reset()
        for a in buttons{
            a.setTitle("*", forState: .Normal)
            a.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
    }
    
    func buttonsPressed(sender: Buttons){
        if !sender.button.isClicked && !sender.button.isMine{
            sender.button.isClicked = true
            sender.setTitleColor(UIColor.greenColor(), forState: .Normal)
            sender.setTitle("\(sender.showText())", forState: .Normal)
            self.win()
        }
        if sender.button.isMine{
            var alertView = UIAlertView()
            alertView.message = "Game Over!"
            alertView.addButtonWithTitle("Keep going")
            alertView.show()
        }
        
    }
    
    func win()
    {
        var flag = true
        var nonMines: [Buttons] = []
        for a in buttons
        {
            if a.button.isMine == false
            {
                nonMines.append(a)
            }
        }
        for b in nonMines
        {
            if b.button.isClicked == false
            {
                flag = false
            }
        }
        if flag == true
        {
            var alertView1 = UIAlertView()
            alertView1.message = "You WON!"
            alertView1.addButtonWithTitle("New Game")
            alertView1.show()
            self.reset()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initialize()
        self.reset()
        self.win()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newGame(sender: UIButton) {
        self.reset()
    }


}

