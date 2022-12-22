//
//  UserRow.swift
//  ListExample
//
//  Created by Виталий Таран on 22.12.2022.
//

import SwiftUI

struct UserRow: View {
    let user: User
    var body: some View {
        HStack (spacing: 12) {
            Image("imagePlaceholder")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(user.name)
        }
        .padding(4)
        
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        let mockUser = User(id: 1, name: "John Doe", avatarUrl: "")
        UserRow(user: mockUser)
    }
}
