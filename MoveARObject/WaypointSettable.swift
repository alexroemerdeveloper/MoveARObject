//
//  WaypointSettable.swift
//  MoveARObject
//
//  Created by Alexander Römer on 13.01.21.
////

import CoreGraphics
import Foundation
import RealityKit

protocol WaypointSettable {
  static var arView    : ARView { get }
  static var boxAnchor : Experience.Box { get }
  static var steelBox  : Entity { get }
  static var waypoint  : ModelEntity { get }
  static var speed     : Float { get }
  static var destinationRelativeToWaypoint: Transform { get }
  static func setWaypoint(centre: CGPoint)
}
//
extension ContentView: WaypointSettable {
    
  static var destinationRelativeToWaypoint: Transform {
    var transform = Transform()
    //Move above the horizontal plane (otherwise it's halfway through it)
    transform.translation.y = 0.0225
    //Rotate to keep the current orientation
    transform.rotation = Self.steelBox.orientation
    return transform
  }
  
  static func setWaypoint(centre: CGPoint) {
    //Cast a ray from the screen to find the horizontal plane in the real world
    let hit = Self.arView.raycast(from: centre, allowing: .existingPlaneInfinite, alignment: .horizontal)
    
    //Use the first hit as the new position of the waypoint
    guard let waypointPosition = hit.first?.worldTransform else { return }
    
    //Move the waypoint plane
    Self.waypoint.move(to: waypointPosition, relativeTo: nil)
    
    //Calculate the time the move animation should take
    let distance    = Self.steelBox.distance(to: Self.waypoint)
    let journeyTime = TimeInterval(distance / Self.speed)
    
    //Turn to face the waypoint and move there
    Self.steelBox.look(at: Self.waypoint.transform.translation, from: Transform().translation, relativeTo: Self.steelBox)
    Self.steelBox.move(to: destinationRelativeToWaypoint, relativeTo: Self.waypoint, duration: journeyTime)
  }
}
