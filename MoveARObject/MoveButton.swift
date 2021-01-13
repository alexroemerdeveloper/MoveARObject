//
//  MoveButton.swift
//  MoveARObject
//
//  Created by Alexander Römer on 13.01.21.
////

import SwiftUI

struct MoveButton: View {
    
  let action: () -> Void
  
  init(_ action: @escaping () -> Void) {
    self.action = action
  }
  
  var body: some View {
    Group {
      Button("Move") {
        action()
      }
      .foregroundColor(.black)
      .padding(15)
      .background(Color.white)
      .cornerRadius(10)
      .padding(.bottom, 50)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
  }
}


//struct MoveButton_Previews: PreviewProvider {
//    static var previews: some View {
//        MoveButton(<#() -> Void#>)
//    }
//}
