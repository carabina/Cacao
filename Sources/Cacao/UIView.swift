//
//  UIView.swift
//  Cacao
//
//  Created by Alsey Coleman Miller on 5/27/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Silica

public class UIView: View, DrawableView, InteractiveView {
    
    // MARK: - Properties
    
    public final var frame: Rect
    
    public final var bounds: Rect { return Rect(size: frame.size) }
    
    public final var backgroundColor: UIColor = UIColor(cgColor: Color.white)
    
    public final var alpha: Double = 1.0
    
    public final var hidden: Bool = false
    
    public final private(set) var subviews: [View] = []
    
    public final var tag: Int = 0
    
    // MARK: - Initialization
    
    public init(frame: Rect = Rect()) {
        
        self.frame = frame
    }
    
    // MARK: - Subclassable Methods
    
    public func draw(_ rect: Rect) { /* implemented by subclasses */ }
    
    public func layoutSubviews() { /* implemented by subclasses */ }
    
    // MARK: - Final Methods
    
    public final func addSubview(_ view: View) {
        
        subviews.append(view)
    }
    
    // MARK: - DrawableView
    
    public final func draw(context: Context) {
        
        guard hidden == false && alpha > 0
            else { return }
        
        UIGraphicsPushContext(context)
        
        // draw background color
        context.fillColor = backgroundColor.CGColor
        context.add(rect: bounds)
        try! context.fill()
        
        // draw rect
        draw(bounds)
        
        UIGraphicsPopContext()
    }
    
    // MARK: - InteractiveView
    
    public final func handle(event: Event) {
        
        
    }
}