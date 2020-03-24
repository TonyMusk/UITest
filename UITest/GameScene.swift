//
//  GameScene.swift
//  UITest
//
//  Created by Studium  on 23.03.20.
//  Copyright © 2020 Studium. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var selectedNode = SKShapeNode()
    let tapRec = UITapGestureRecognizer()
    let rotateRec = UIRotationGestureRecognizer()
    let panRec = UIPanGestureRecognizer()
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        tapRec.addTarget(self, action:#selector(GameScene.tappedView(_:) ))
        tapRec.numberOfTouchesRequired = 1
        tapRec.numberOfTapsRequired = 1
        self.view!.addGestureRecognizer(tapRec)
        
        rotateRec.addTarget(self, action: #selector (GameScene.rotatedView (_:) ))
        self.view!.addGestureRecognizer(rotateRec)
        
        panRec.addTarget(self, action: #selector (GameScene.panView (_:) ))
        self.view!.addGestureRecognizer(panRec)
        
        let slicer = PolygonSlicer(polygonGrade: 4, nrOfShapes: 1)
        var paths = slicer.createPaths()
        var counter = 0
        for p in paths{
            let shape = SKShapeNode()
            shape.path = p.cgPath
            shape.name = String(counter)
            counter += 1
            shape.physicsBody =  SKPhysicsBody(polygonFrom: p.cgPath)
            shape.position = CGPoint(x: frame.midX, y: frame.midY)
            shape.physicsBody?.affectedByGravity = false
            shape.fillColor = UIColor.black
            self.addChild(shape)
        }
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        //         Called before each frame is rendered
    }
    
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        let touch = touches.first as! UITouch
    //        let positionInScene = touch.location(in: self)
    //
    //        let touchedNode = self.atPoint(positionInScene)
    //
    //        if (touchedNode is SKShapeNode || touchedNode is SKSpriteNode) {
    //            selectedNode = touchedNode as! SKShapeNode
    //            selectedNode.physicsBody?.mass = 0.05
    //            selectedNode.physicsBody?.allowsRotation = false
    //            selectedNode.fillColor = UIColor.red
    //        }
    //
    //
    //    }
    //
    //    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        //selectedNode.run(SKAction.rotate(toAngle: 0.0, duration: 0.1))
    //        //selectedNode.removeAllActions()
    //        selectedNode.physicsBody?.mass = 0.5
    //        selectedNode.physicsBody?.allowsRotation = true
    //        selectedNode.fillColor = UIColor.black
    //    }
    //
    //
    //    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        let touch = touches.first as! UITouch
    //        let positionInScene = touch.location(in: self)
    //        selectedNode.position = positionInScene
    //    }
    
    @objc func tappedView(_ sender:UITapGestureRecognizer) {
        
        if sender.state == .ended {
            // handling code
            
            print("Single tap")
            //var touchLocation: CGPoint = sender.location(in: sender.view)
            
            
            let point = sender.location(in: sender.view)
            
            
            var touchLocation = self.convertPoint(fromView: point)
            
            print("Tapped at point \(touchLocation)")
            let touchedNode = self.atPoint(touchLocation)
            
            if (selectedNode == touchedNode){
                print("selectedNode name \(selectedNode.name)")
                selectedNode.fillColor = UIColor.black
                selectedNode = SKShapeNode()
            }
                
            else if (touchedNode is SKShapeNode || touchedNode is SKSpriteNode) {
                selectedNode.fillColor = UIColor.black
                selectedNode = touchedNode as! SKShapeNode
                selectedNode.fillColor = UIColor.blue
                //selectedNode.run(SKAction.rotate(byAngle: 0.5, duration: 1))
                
                print("Selected \(selectedNode.name)")
                print(point)
                
            }
        }
        
    }
    
    @objc func panView(_ sender:UIRotationGestureRecognizer) {
        
        if(sender.state == .began){
            print("Pan began")
        }
        
        if(sender.state == .changed){
            
            let positionInScene = sender.location(in: self.view)
            var touchLocation = self.convertPoint(fromView: positionInScene)
            selectedNode.position = touchLocation
        }
    }
    
    @objc func rotatedView(_ sender:UIRotationGestureRecognizer) {
        
        if (sender.state == .began) {
            
            print("rotation began")
            
        }
        if (sender.state == .changed) {
            
            print("rotation changed")
            
            //you could easily make any sprite's rotation equal this amount like so...
            //thePlayer.zRotation = -sender.rotation
            
            //convert rotation to degrees...
            let rotateAmount = Measurement(value: Double(sender.rotation), unit: UnitAngle.radians).converted(to: .degrees).value
            selectedNode.zRotation = -sender.rotation
            print("\(rotateAmount) degreess" )
            
            
            
        }
        if (sender.state == .ended) {
            print("rotation ended")
        }
        
        
    }
    
    func degToRad(degree: Double) -> CGFloat {
        return CGFloat(Double(degree) / 180.0 * M_PI)
    }
    
}
