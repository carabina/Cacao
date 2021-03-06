//
//  ScreenTests.swift
//  Cacao
//
//  Created by Alsey Coleman Miller on 5/15/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import XCTest
import Cairo
import Silica
import Cacao

final class ScreenTests: XCTestCase {
    
    static let allTests: [(String, (ScreenTests) -> () throws -> Void)] = [ ("testSimpleSubviews", testSimpleSubviews)]
    
    func testSimpleSubviews() {
        
        class TestViewController: ViewController {
            
            let needsDisplay = false
            
            func view(frame: Rect) -> View {
                
                let backgroundView = UIView(frame: frame)
                
                let view1 = UIView(frame: Rect(origin: Point(x: 10, y: 10), size: Size(width: 80, height: 80)))
                
                view1.backgroundColor = UIColor(cgColor: Color.black)
                
                let subview1 = UIView(frame: Rect(origin: Point(x: 10, y: 10), size: Size(width: 60, height: 60)))
                
                subview1.backgroundColor = UIColor(cgColor: Color.white)
                
                let subview2 = UIView(frame: Rect(origin: Point(x: 20, y: 20), size: Size(width: 20, height: 20)))
                
                subview2.backgroundColor = UIColor(cgColor: Color.blue)
                
                subview1.addSubview(subview2)
                
                view1.addSubview(subview1)
                
                backgroundView.addSubview(view1)
                
                return backgroundView
            }
        }
        
        let size = Size(width: 100, height: 100)
        
        let filename = outputDirectory + "simpleSubviews.pdf"
        
        let surface = Surface(pdf: filename, width: size.width, height: size.height)
        
        let screen = Screen(surface: surface, size: size)
        
        screen.rootViewController = TestViewController()
        
        try! screen.render()
        
        print("Wrote to \(filename)")
    }
}
