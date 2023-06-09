//
//  howtoplay.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 31/03/2023.
//
import SwiftUI


struct Howtoplay: View {
   @State private var showSheet = false
    let impact = UIImpactFeedbackGenerator() //set vibration
    @AppStorage("vibration ") var vibration = true

    let pages = [
        WelcomeSheetPage(title: "Welcome to Tic tac toe ", rows: [
            WelcomeSheetPageRow(imageSystemName:"person.2.circle.fill",
                                accentColor: Color.mint,
                                title: "Made by Max21910",
                                content: "For the swift Challenge 2023  Made with ❤️ in 🇫🇷"),
            
            WelcomeSheetPageRow(image: Image("GithubIcon"),
                                accentColor: Color.indigo,
                                title: "Open Source", content: "Find this project on https://github.com/max21910/Swift-Challenge2023"),
            
            WelcomeSheetPageRow(imageSystemName: "ipad.and.iphone",
                                accentColor: Color.green,
                                title: "compatible to all Apple platforms.",
                                content: "Written  100% Swift UI")
        ], accentColor: Color.purple, optionalButtonTitle: "Find this project in github", optionalButtonURL: URL(string: "https://github.com/max21910/Swift-Challenge2023")),
        
        WelcomeSheetPage(title: "How to play ?", rows: [
            WelcomeSheetPageRow(imageSystemName: "01.circle",
                                title: "",
                                content: "To play, simply tap on an empty square to place your mark. The game will automatically switch between X's and O's until a winner is declared or the game ends in a tie"),
            
            WelcomeSheetPageRow(imageSystemName:"02.circle",
                                title: "",
                                content: "The game is played on a 3x3 grid.Players take turns placing their mark (X or O) on an empty square."),
            
            WelcomeSheetPageRow(imageSystemName:"03.circle",
                                title: "",
                                content: "The first player to get 3 of their marks in a row (horizontally, vertically, or diagonally) wins.If all 9 squares are filled and no player has won, the game ends in a tie.")
        ], mainButtonTitle: "Lets Play !")
    ]
    
    var body: some View {
        
        Button(action: {
            if vibration == true {
                impact.impactOccurred()
            }
            showSheet.toggle()
            
        }, label: {
            HStack {
                Image(systemName: "chart.bar.doc.horizontal.fill")
                    .frame(width: 10,height: 10)
                Text("Instruction")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.callout)
                    .frame(width: 100,height: 60)
                
            }
           
        })
           
.welcomeSheet(isPresented: $showSheet,
                      onDismiss: {
           print("Instruction card dismiss")
    
},
                    isSlideToDismissDisabled: true,
                    pages: pages)

    }
}
