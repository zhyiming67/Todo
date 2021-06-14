//
//  TodoApp.swift
//  Todo
//
//  Created by Zhu, Yiming on 6/11/21.
//
import Amplify
import AWSDataStorePlugin
import SwiftUI

@main
struct TodoApp: App {
    public init() {
           configureAmplify()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

func configureAmplify() {
   let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
   do {
       try Amplify.add(plugin: dataStorePlugin)
       try Amplify.configure()
       print("Initialized Amplify");
   } catch {
       // simplified error handling for the tutorial
       print("Could not initialize Amplify: \(error)")
   }
}
