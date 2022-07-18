//
//  UserView.swift
//  RandomUsers
//
//  Created by Roman on 11.07.2022.
//

import SwiftUI

struct UserView: View {
  @StateObject var userData = UserData()

  var body: some View {
    NavigationView {
      List(userData.users) { user in
        Text(user.fullName)
      }
      .navigationTitle("Random Users")
    }
  }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
