//
//  StoreAppApp.swift
//  StoreApp
//
//  Created by Hari krishna on 23/12/22.
//

import SwiftUI

@main
struct StoreAppApp: App {
    @StateObject private var storeModel = StoreModel()
    var body: some Scene {
        WindowGroup {
            CategoryListScreen().environmentObject(storeModel)
        }
    }
}
