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
    let lineWidth: CGFloat = 4
    
    var body: some View {
        NavigationView {
            VStack{
                GeometryReader { geometry in
                    ZStack {
                        LazyVGrid(
                            columns: viewModel.columns,
                            spacing: 0,
                            content: {
                                ForEach(0..<9){i in
                                    ZStack{
                                        Image(systemName: viewModel.moves[i]?.getIconName() ?? "")
                                            .resizable()
                                            .foregroundColor(viewModel.moves[i]?.player == .human ? .blue : .red)
                                            .frame(
                                                width: geometry.size.width / 3 - 70,
                                                height: geometry.size.width / 3 - 70
                                            )
                                            .aspectRatio(contentMode: .fit)
                                    }
                                    .frame(
                                        width: geometry.size.width / 3,
                                        height: geometry.size.width / 3
                                    )
                                    .onTapGesture {
                                        viewModel.proccessPlayerMove(in: i)
                                    }
                                }
                            }
                        )
                        
                        // Rendering Board
                        VStack{
                            Spacer()
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: geometry.size.width, height: lineWidth)
                            Spacer()
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: geometry.size.width, height: lineWidth)
                            Spacer()
                        }
                        
                        HStack{
                            Spacer()
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: lineWidth, height: geometry.size.width)
                            Spacer()
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: lineWidth, height: geometry.size.width)
                            Spacer()
                        }
                    }
                }
                .padding(20)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            }
            .alert(
                item: $viewModel.alertItem,
                content:{alertItem in
                    Alert(
                        title: alertItem.title,
                        message: alertItem.message,
                        dismissButton: .default(alertItem.buttonText, action: {viewModel.reset()})
                    )
                }
            )
            .navigationBarTitle("Tic Tac Toe", displayMode: .inline)
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
