//
//  ContentView.swift
//  ListExample
//
//  Created by Виталий Таран on 22.12.2022.
//

import Combine
import SwiftUI

struct ContentView: View {
    // 1
    @ObservedObject private var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            List {
                // 2
                ForEach(userViewModel.users, id: \.id) { user in
                    UserRow(user: user)
                }
                // 3
                LoaderView(isFailed: userViewModel.isRequestFailed)
                    .onAppear(perform: fetchData)
                    .onTapGesture(perform: onTapLoadView)
            }
            .navigationTitle("GitHub Users")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    // 4
    private func fetchData() {
        userViewModel.getUsers()
    }
    
    // 5
    private func onTapLoadView() {
        if userViewModel.isRequestFailed {
            userViewModel.isRequestFailed = false
            fetchData()
        }
    }
}
