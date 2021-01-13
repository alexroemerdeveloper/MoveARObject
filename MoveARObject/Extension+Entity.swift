//
//  Extension+Entity.swift
//  MoveARObject
//
//  Created by Alexander Römer on 13.01.21.
////

import RealityKit

extension Entity {
    func distance(to otherEntity: Entity) -> Float {
        let translation         = self.transformMatrix(relativeTo: nil).columns.3
        let otherTranslation    = otherEntity.transformMatrix(relativeTo: nil).columns.3
        let vectorToOtherEntity = otherTranslation - translation
        return length(vectorToOtherEntity)
    }
}
