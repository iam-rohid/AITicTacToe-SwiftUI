//
//  SettingsView.swift
//  TicTacToe
//
//  Created by Rohid on 31/5/21.
//

import SwiftUI

struct SettingsModal: View {
    @Binding var showModal: Bool
    @Binding var hardnessLevel: Int
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Game Settings")){
                    Picker("Hardness Level", selection: $hardnessLevel){
                        Text("Easy").tag(0)
                        Text("Normal").tag(1)
                        Text("Hard").tag(2)
                    }
                }
            }.navigationBarTitle(Text("Settings"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                showModal = false
            }, label: {
                Text("Close")
            }))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State var showModal = true
    static var previews: some View {
        SettingsModal(showModal: .constant(true), hardnessLevel: .constant(0))
    }
}
