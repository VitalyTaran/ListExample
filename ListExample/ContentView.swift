//
//  ContentView.swift
//  ListExample
//
//  Created by Виталий Таран on 22.12.2022.
//

import SwiftUI

struct ContentView: View {
    var users = [
        User(id: 100, name: "Bob", avatarUrl: ""),
        User(id: 200, name: "Alice", avatarUrl: "")
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    UserRow(user: user)
                }
            }
            .navigationTitle("GitHub Users")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
