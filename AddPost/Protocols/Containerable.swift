//
//  Containerable.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//

import Swinject

// Creating a protocol in order for all child Containters to have something in common.
// All child containers will conform to that protocol.
// They will have reference to a main container as well as register function.
protocol Containerable {
    var mainContainer: MainContainer { get }
    init(mainContainer: MainContainer)
    func register()
}
// Extension to provide root container reference easily
extension Containerable {
    var rootContainer: Container {
        return mainContainer.rootContainer
    }
}
