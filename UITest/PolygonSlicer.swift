//
//  PolygonSlicer.swift
//  SpriteKitTest
//
//  Created by Theresia Viktoria Beiser on 21.03.20.
//  Copyright © 2020 Studium. All rights reserved.
//


import SpriteKit
import GameplayKit

class PolygonSlicer {
    var polygonGrade: Int
    var nrOfShapes: Int
    
    init(polygonGrade: Int, nrOfShapes: Int) {
        self.polygonGrade = polygonGrade
        self.nrOfShapes = nrOfShapes
    }
    
    
    func createPaths() -> [UIBezierPath]{
        //random punkte im fünfeck generieren
                
        let xrelzuab = CGFloat(100.0)
        let yrelzuab = CGFloat(100.0)
        
        print(xrelzuab)
        print(yrelzuab)
        
        let pointa = CGPoint(x:0.0*xrelzuab,y:0.0*yrelzuab)
        let pointb = CGPoint(x:1.0*xrelzuab,y:0.0*yrelzuab)
        let pointc = CGPoint(x:1.3*xrelzuab,y:1.0*yrelzuab)
        let pointd = CGPoint(x:0.5*xrelzuab,y:1.5*yrelzuab)
        let pointe = CGPoint(x:-0.3*xrelzuab,y:1.0*yrelzuab)
        
        
        var xrandom = CGFloat.random(in: 0.2..<0.8)
        var yrandom = CGFloat.random(in: 0.3..<1)
        
        //let xrandom2 = CGFloat.random(in: 0.1..<0.2)
        //let yrandom2 = CGFloat.random(in: 0.1..<0.2)
        
        //let xrandom3 = CGFloat.random(in: 0.3..<0.4)
        //let yrandom3 = CGFloat.random(in: 0.3..<0.4)
        
        
        print(xrandom)
        print(yrandom)
        
        var randompoint = CGPoint(x:xrandom*xrelzuab,y:yrandom*yrelzuab)
        
        //let randompoint2 = CGPoint(x:(xrandom + xrandom2)*xrelzuab, y: ((yrandom + yrandom2)*yrelzuab))
        //let randompoint3 = CGPoint(x:(xrandom - xrandom3)*xrelzuab, y: ((yrandom - yrandom3)*yrelzuab))
        
        
        print(randompoint)
        
        var randomb = CGFloat.random(in: 0.2..<0.8)
        var randomonb = CGPoint(x:(1+(0.3*randomb))*xrelzuab,y:(randomb*1)*yrelzuab)
        
        var randomd = CGFloat.random(in: 0.2..<0.8)
        var randomond = CGPoint(x:(0.5+(-0.8*randomd))*xrelzuab,y:(1.5+(-0.5*randomd))*yrelzuab)
        
        print(randomonb,randomond)
        
        var array5_4 = [pointa, pointb, pointc, pointd, pointe, randompoint, randomonb, randomond]
        
        // shape ist das erste Teil des Fünfecks - von random zu a zu b zu randomb zu random !
        
        let shape1 = SKShapeNode()
        
        let bpath = UIBezierPath()
        
        var displacementPoint = (array5_4[5] + array5_4[0] + array5_4[1] + array5_4[6])/CGFloat(4.0)
    
        
        bpath.move(to: (array5_4[5]-displacementPoint))
        bpath.addLine(to: array5_4[0]-displacementPoint)
        bpath.addLine(to: array5_4[1]-displacementPoint)
        bpath.addLine(to: array5_4[6]-displacementPoint)
        bpath.close()
        
    
                
        let bpath2 = UIBezierPath()
        
        
        displacementPoint = (array5_4[5] + array5_4[6] + array5_4[2] + array5_4[3] + array5_4[7])/CGFloat(5.0)
            
        bpath2.move(to: (array5_4[5]-displacementPoint))
        bpath2.addLine(to: array5_4[6]-displacementPoint)
        bpath2.addLine(to: array5_4[2]-displacementPoint)
        bpath2.addLine(to: array5_4[3]-displacementPoint)
        bpath2.addLine(to: array5_4[7]-displacementPoint)
        bpath2.close()
        
        let shape3 = SKShapeNode()
                
        let bpath3 = UIBezierPath()
        
        displacementPoint = (array5_4[5]+array5_4[7]+array5_4[4])/CGFloat(3.0)
        
        bpath3.move(to: (array5_4[5]-displacementPoint))
        bpath3.addLine(to: array5_4[7]-displacementPoint)
        bpath3.addLine(to: array5_4[4]-displacementPoint)
        bpath3.close()
                
       
        let bpath4 = UIBezierPath()
        
        displacementPoint = (array5_4[5] + array5_4[4] + array5_4[0])/CGFloat(3.0)
        
        bpath4.move(to: (array5_4[5]-displacementPoint))
        bpath4.addLine(to: array5_4[4]-displacementPoint)
        bpath4.addLine(to: array5_4[0]-displacementPoint)
        bpath4.close()
        
                
       return [bpath, bpath2, bpath3, bpath4]
    }
    
  
}

func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
      return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
  }

func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
      return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
  }
  
func /(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
}
