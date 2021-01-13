//
//  ContentView.swift
//  MoveARObject
//
//  Created by Alexander Römer on 13.01.21.
//

import SwiftUI
import RealityKit

struct ContentView : View {
  static let arView    = ARView(frame: UIScreen.main.bounds)
  static let boxAnchor = try! Experience.loadBox()
  static let steelBox  = boxAnchor.steelBox!
  static let waypoint  = ModelEntity(mesh: .generatePlane(width: 0.1, depth: 0.1))
  static let speed     = Float(0.2)
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        ARViewContainer(boxAnchor: Self.boxAnchor, arView: Self.arView, wayPoint: Self.waypoint)
        Text("⚀")
          .font(.largeTitle)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
        MoveButton {
          Self.setWaypoint(centre: geometry.frame(in: .global).centre)
        }
      }
    }
    .edgesIgnoringSafeArea(.all)
  }
}


struct ARViewContainer: UIViewRepresentable {
    
    
    let boxAnchor: Experience.Box
    let arView: ARView
    let wayPoint: ModelEntity
    
    func makeUIView(context: Context) -> ARView {
        arView.scene.anchors.append(boxAnchor)
        arView.scene.anchors.first?.addChild(wayPoint)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}



#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
#endif
