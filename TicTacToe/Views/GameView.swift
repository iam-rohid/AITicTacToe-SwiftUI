//
//  ContentView.swift
//  TicTacToe
//
//  Created by Rohid on 23/5/21.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel = GameViewModel()
    @State private var showSettingsModal = false
    var body: some View {
        NavigationView {
            VStack{
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        LazyVGrid(
                            columns: viewModel.columns,
                            spacing: 10,
                            content: {
                                ForEach(0..<9){i in
                                    ZStack{
                                        CellView(proxy: geometry)
                                        CellImageView(
                                            proxy: geometry,
                                            systemName: viewModel.moves[i]?.getIconName() ?? "",
                                            color: viewModel.moves[i]?.player == .human ? .blue : .red
                                        )
                                    }.onTapGesture {
                                        viewModel.proccessPlayerMove(in: i)
                                    }
                                }
                            }
                        ).padding(20)
                        Spacer()
                    }
                }
            }.alert(
                item: $viewModel.alertItem,
                content:{alertItem in
                    Alert(
                        title: alertItem.title,
                        message: alertItem.message,
                        dismissButton: .default(alertItem.buttonText, action: {viewModel.reset()})
                    )
                }
            )
            .navigationBarTitle("Tic Tac Toe")
            .toolbar{
                Button(action: {
                    showSettingsModal = true
                }, label: {
                    Text("Settings")
                })
            }
            .sheet(
                isPresented: $showSettingsModal,
                content: {
                    SettingsModal(
                        showModal: $showSettingsModal,
                        hardnessLevel: $viewModel.hardnessLevel
                    )
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
