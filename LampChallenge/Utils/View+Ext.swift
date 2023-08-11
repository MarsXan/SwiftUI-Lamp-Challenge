//
//  View+Ext.swift
//  LampChallenge
//
//  Created by mohsen mokhtari on 8/11/23.
//

import SwiftUI

extension View {
    func vAlign(_ alignment: Alignment) -> some View {
        self.frame(maxHeight: .infinity, alignment: alignment)
    }

    func hAlign(_ alignment: Alignment) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
}
