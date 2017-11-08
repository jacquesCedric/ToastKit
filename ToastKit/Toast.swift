//
//  Toast.swift
//  ToastKit
//
//  Created by Jacob Gold on 8/11/17.
//  Copyright © 2017 Jacob Gold. All rights reserved.
//

import Cocoa

// MARK: - External call
extension NSViewController {
    public func toast(message: String, fade: CFTimeInterval = 1.8) {
        let toast = makeToast(message: message)
        self.view.addSubview(toast)
        
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(>=20)-[toast]-20-|", options: .alignAllBottom, metrics: nil, views: ["toast" : toast])
        NSLayoutConstraint.activate(vConstraints)
        toast.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        animateToast(toast, fade: fade)
    }
}

//////////////////////////////////////////////
// MARK: - Internal funcs
fileprivate extension NSViewController {
    // Generate the message component of the toast
    func createTextLabel(message: String) -> NSTextField {
        let tf = NSTextField(frame: NSMakeRect(0, 0, 200, 17))
        tf.stringValue = message
        let stf = styleTextLabel(tf: tf)
        
        return stf
    }
    
    func makeToast(message: String) -> NSView{
        let v = NSView()
        // Styling
        v.wantsLayer = true;
        v.layer = styleToast()
        
        // Add message
        let m = createTextLabel(message: message)
        v.addSubview(m)
        //        v.frame = m.frame
        m.translatesAutoresizingMaskIntoConstraints = false
        v.translatesAutoresizingMaskIntoConstraints = false
        
        // Constrain the views
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-5-[m]-5-|", options: .alignAllTop, metrics: nil, views: ["m" : m])
        NSLayoutConstraint.activate(hConstraints)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[m]-5-|", options: .alignAllTop, metrics: nil, views: ["m" : m])
        NSLayoutConstraint.activate(vConstraints)
        let widthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "[m(>=50,<=300)]", options: .alignAllTop, metrics: nil, views: ["m" : m])
        NSLayoutConstraint.activate(widthConstraints)
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[m(>=17)]", options: .alignAllTop, metrics: nil, views: ["m" : m])
        NSLayoutConstraint.activate(heightConstraints)
        
        return v
    }
    
    
    //////////////////////////////////////////////
    // MARK: - Aesthetics
    
    // Style the toast
    func styleToast() -> CALayer {
        let toastLayer = CALayer()
        toastLayer.backgroundColor = NSColor.black.withAlphaComponent(0.8).cgColor
        toastLayer.cornerRadius = 8
        toastLayer.opacity = 0.8
        
        return toastLayer
    }
    
    // Style the message text
    func styleTextLabel(tf: NSTextField) -> NSTextField {
        // Sizing
        var f = tf.frame
        f.size.height = tf.intrinsicContentSize.height
        tf.frame = f
        
        // Basic appearance jazz
        tf.textColor = NSColor.white
        tf.drawsBackground = false
        tf.isBordered = false
        tf.focusRingType = .none
        tf.isEditable = false
        tf.isSelectable = false
        tf.alignment = .center
        
        return tf
    }
    
    // Animate fade out
    func animateToast(_ toast: NSView, fade: CFTimeInterval) {
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0.8
        animation.toValue = 0.0
        animation.beginTime = CACurrentMediaTime() + 1.0
        animation.duration = fade
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            toast.removeFromSuperview()
        }
        toast.layer?.add(animation, forKey: "fadeout")
        CATransaction.commit()
    }
}
