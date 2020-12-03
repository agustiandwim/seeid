//
//  FCollectionReference.swift
//  seeid
//
//  Created by Agustian DM on 12/09/20.
//  Copyright © 2020 Agustian DM. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}
