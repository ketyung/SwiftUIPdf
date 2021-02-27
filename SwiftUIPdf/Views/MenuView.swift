//
//  MenuView.swift
//  SwiftUIPdf
//
//  Created by Chee Ket Yung on 23/02/2021.
//

import SwiftUI

struct MenuView : View {
    
    
    var body : some View {
        
        NavigationView {
            
            List {
                
                NavigationLink( destination: ContentView()){
                    
                    Text ("1. A simple PDF composer app created in SwiftUI and the MVVM way")
                }
            
                NavigationLink( destination: ViewControllerSwiftUIView().navigationTitle(Text("Example 1")) ){
                    
                    Text ("2. An example of PDF created in a UIKit ViewController and is wrapped by UIViewControllerRepresentable in SwiftUI")
                }
                
                
                NavigationLink( destination: WebView(urlString: "https://blog.techchee.com/pdf-composer-app-swiftui") ){
                    
                    Text ("3. The tutorial blog post explaining No 1. on how to create a simple PDF composer app in SwiftUI")
                }
               
            }
            .navigationTitle(Text("Menu"))
           
        }
        .navigationViewStyle(StackNavigationViewStyle())
      
        
    }
}
