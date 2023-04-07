//
//  UserView.swift
//  RandomUsers
//
//  Created by Roman on 11.07.2022.
//

import SwiftUI

struct UsersView: View {
    @StateObject var userData = UserData()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                List(userData.users) { user in
                    HStack {
                        AsyncImage(url: URL(string: user.picture.thumbnail)) { image in
                            image.clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "person")
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                        Text(user.fullName)
                    }
                }
                .navigationTitle("Random Users")

                Button(action: {
                    print("Button")
                    Task {
                        await userData.loadUsers()
                    }
                }, label: {
                    Text("Refresh list")
                        .foregroundColor(Color.white)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 20)
                        .buttonStyle(.bordered)
                        .background(Color.secondary)
                        .cornerRadius(10)
                })
                .padding(.vertical, 10)
            }

        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
