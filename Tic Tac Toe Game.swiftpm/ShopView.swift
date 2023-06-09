//
//  ShopView.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 03/04/2023.
//
import SwiftUI

struct Item: Identifiable {
    let id: String
    let name: String
    let price: Int
}
struct ShopView: View {
    @AppStorage("Coins1") var Coins: Int = 1000
    @AppStorage("⬛️ Background ") var black = false
    @AppStorage("🟥 Background") var red = false
    @AppStorage("blueon") var blueon = false
    @AppStorage("redon") var redon = false
    @AppStorage("blackon") var blackon = false
    @AppStorage("moneyanim ") var moneyanim = false
    @AppStorage("moneyanimon ") var moneyanimon = false
    @AppStorage("loveanim ") var loveanim = false
    @AppStorage("loveanimon ") var loveanimon = false
    @AppStorage("vibration ") var vibration = true
    @AppStorage("numberobjects") var numberobjects = 0
    @AppStorage("GridView") var GridView = true
    @State private var devoption = false
    @State private var Completepurchase = false
    @State private var Errorpurshase = false
    @State private var hapticon = false
   
    
    let impact = UIImpactFeedbackGenerator()
    @State var isAnimating: Bool = false
    
    
    //Items inside the shop
    let items = [
        
        Item(id: "two", name: "⬛️ Background", price: 50),
        Item(id: "three", name: "🟥  Background", price: 100),
        Item(id: "four", name: "💸 Money Animation", price: 150),
        Item(id: "five", name: "❤️ love Animation", price: 300),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: CoinExplanationView()) {
                        Image(systemName: "dollarsign.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.yellow)
                        Text("\(Coins)")
                            .font(.headline)
                            .foregroundColor(.yellow)
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                  
                    Spacer()
                   
                }
                .padding(.horizontal, 20)
                List(items) { item in
                    HStack {
                        Text(item.name)
                        
                        if itemIsPurchased(item) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                        } else {
                            
                            
                            Text("\(item.price) Coins")
                                .foregroundColor(.yellow)
                            
                            
                            
                            Button(action: {
                                if item.price <= Coins {
                                    withAnimation {
                                        Coins -= item.price
                                        markItemAsPurchased(item)
                                        Completepurchase.toggle()
                                        if vibration == true {
                                            impact.impactOccurred()
                                        }
                                    }
                                    
                                } else {
                                    withAnimation {
                                        
                                        Errorpurshase.toggle()
                                        if vibration == true {
                                            impact.impactOccurred()
                                        }
                                    }
                                }
                                
                                
                                
                            }){
                                HStack {
                                    Spacer()
                                    Text("Buy")
                                        .foregroundColor(.blue)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .background(Color.blue.opacity(0.2))
                                        .clipShape(Capsule())
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            
                            
                        }
                    }
                }
                Text("You own \(numberobjects) /4 objects")
                VStack {
                    HStack{
                        Image(systemName: "gear")
                            .rotationEffect(.degrees(isAnimating ? 360 : 0))
                            .onAppear {
                                withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                                    isAnimating.toggle()
                                }
                            }
                        
                        Text("Settings : ")
                            .font(.title)
                            .bold()
                    }
                    Toggle(isOn: $vibration) {
                        
                        HStack{
                            Image(systemName: "iphone.gen3.radiowaves.left.and.right")
                            
                            
                            Text("Haptic Feedback")
                        }
                    }
                    
                    Toggle(isOn: $GridView) {
                        Text("Enable Grid ")
                    }
                    
                    
                    
                    
                    if black == true {
                        Toggle(isOn: $blackon) {
                            Text("⬛️ Background ")
                        }.disabled(redon)
                        
                    }
                    if red == true {
                        Toggle(isOn: $redon) {
                            Text(" 🟥  Background")
                        }.disabled(blackon)
                    }
                    if moneyanim == true {
                        Toggle(isOn: $moneyanimon) {
                            Text(" 💸 Animation ")
                        }.disabled(loveanimon)
                        
                    }
                    if loveanim == true {
                        Toggle(isOn: $loveanimon) {
                            Text("❤️ Animation ")
                        }.disabled(moneyanimon)
                        
                    }
                    Toggle(isOn: $devoption ) {
                        Text("⚠️📱 Show dev option 📱⚠️")
                    }
                    if devoption == true {
                        HStack {
                            Button {  //reset shop achat
                                if vibration == true {
                                    impact.impactOccurred()
                                }
                                black = false
                                red = false
                                moneyanim = false
                                loveanim = false
                                loveanimon = false
                                moneyanimon = false
                                redon = false
                                blackon = false
                                numberobjects = 0
                                
                            } label: {
                                Text("reset shop")
                                    .frame(width: 100,
                                           height: 50,
                                           alignment: .center)
                                    .background(Color.green)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(20)
                            }
                            Button { //add 1000 coin to test shop
                                
                                Coins = Coins + 1000
                                if vibration == true {
                                    impact.impactOccurred()
                                }
                            } label: {
                                Text("add coin")
                                    .frame(width: 100,
                                           height: 50,
                                           alignment: .center)
                                    .background(Color.green)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(20)
                            }
                            Button {   //reset coin to zero to test insufficientCoins function
                                
                                Coins =  0
                                if vibration == true {
                                    impact.impactOccurred()
                                }
                            } label: {
                                Text("reset coin")
                                    .frame(width: 100,
                                           height: 50,
                                           alignment: .center)
                                
                                    .background(Color.green)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(20)
                            }
                            
                            
                        }
                    }
                }
                
                
                .padding()
                
                Spacer() // Ajout du Spacer
                //animation if insufficientCoins is true
                if numberobjects == 4 {
                    Text("Congratulation ! 👑 You own everythings")
                    //code for own everythings
                }
                
                
                
                
            }
            .navigationTitle("Shop") //title of the pages
            
        }
        .toast(isPresenting: $Completepurchase){
            
            // `.alert` is the default displayMode
            AlertToast(displayMode: .banner(.pop),type: .complete(.green), title: "Purchase Completed!", subTitle: nil)
        }
        .toast(isPresenting: $hapticon){
            
            // `.alert` is the default displayMode
            AlertToast(displayMode: .banner(.pop),type: .complete(.green), title: "Haptic Feedback Activated", subTitle: nil)
        }
        .toast(isPresenting: $Errorpurshase){
            AlertToast(type: .error(.red), title: "Error occur", subTitle: "Not enough Coins")
            
        }
        
    }
    
    //if a items is purshase this function link the items with is variable
    func itemIsPurchased(_ item: Item) -> Bool {
        switch item.id {
        case "two":
            return black
        case "three":
            return red
        case "four":
            return moneyanim
        case "five":
            return loveanim
            
        default:
            return false
        }
    }
    
    //this function mark items if is it Purchased and return a true variable
    func markItemAsPurchased(_ item: Item) {
        switch item.id {
            
        case "two":
            black = true
            numberobjects = numberobjects + 1
        case "three":
            red = true
            numberobjects = numberobjects + 1
        case "four":
            moneyanim = true
            numberobjects = numberobjects + 1
        case"five":
            loveanim = true
            numberobjects = numberobjects + 1
            
            
        default:
            break
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
