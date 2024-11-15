// Accounts selection page

import SwiftUI

struct MainPageView: View {
    var accounts: [Account]
                                   
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Hi, YY!")
                    .font(.title)
                    .padding(.bottom, 5)
                    .padding(.horizontal)
                
                Text("Accounts:")
                    .font(.headline)
                    .padding(.horizontal)
                
                VStack {
                    ForEach(accounts) { account in
                        NavigationLink(destination: Page2View(account: account)) {
                            HStack {
                                Circle()
                                    .frame(width: 45, height: 45)
                                    .overlay(Text("A").font(.title))  // Placeholder icon
                                Text(account.name)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // “+”按钮，用于添加新账户
                    Button(action: {
                        // 添加新账户
                        let newAccount = Account(name: "Account\(accounts.count + 1)")
                    }) {
                        HStack {
                            Image(systemName: "plus.circle")
                            Text("Add Account")
                        }
                        .padding(.top)
                        .font(.headline)
                    }
                }
                
                Spacer()
                
            }
        }
    }
}

struct Page2View: View {
    var account : Account
    
    var body: some View {
        VStack{
            if let firstAccount = accounts.first {
                ContentView(account: firstAccount)
            } else {
                Text("No account available")
            }
        }
        .navigationTitle(account.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
