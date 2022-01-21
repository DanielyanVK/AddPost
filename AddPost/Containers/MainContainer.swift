//
//  MainContainer.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//
import Swinject

// Main Container to store other containers
// Containers hierarchy for future reference. Very important

// 1. MainContainer - Main Object
// 2. Containerable - Protocol that for all child containers to conform to
// 3. PostContainer - Child Container
// Container - Swinject Class

class MainContainer {
    // creating init of and array of Containerable protocol that all our child containers conform to and passing it to init
    private let containers: [Containerable]
    // we will refer to root container whenever we need to do anything involving MainContainer's functions
    let rootContainer: Container = Container()
    
    init(containers: [Containerable]) {
        self.containers = containers
    }
    // We have to collect all smaller containers in to main one and register them
    func setup() {
        containers.forEach { (container) in
            container.register()
        }
    }
}
