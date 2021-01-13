//
//  Extension+CGRect.swift
//  MoveARObject
//
//  Created by Alexander Römer on 13.01.21.
////

import CoreGraphics

extension  CGRect {
    var centre: CGPoint {
        CGPoint(x: width / 2, y: height / 2)
    }
}
