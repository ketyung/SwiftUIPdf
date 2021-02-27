//
//  ContentView.swift
//  SwiftUIPdf
//
//  Created by Chee Ket Yung on 21/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var contentViewModel : ContentViewModel
   
    
    var body: some View {
        
        // NavigationView {
        VStack {
       
            form()
        
            buttons()
            
            Spacer()
        }
        .navigationTitle(Text("PDF Composer"))
        //}
    }
}

extension ContentView {
    
    private func form() -> some View {
        
        Form {
    
            TextField("Title", text: $contentViewModel.title )
            
            Text("Body")
            .font(.headline)
            
            TextEditor(text: $contentViewModel.body)
            .frame(height: 100)

        }
        .frame(height: 270)
        .padding(4)
    }
    
    
    private func buttons() -> some View {
        
        HStack(spacing : 50) {
                
            NavigationLink(destination : PdfPreviewView() ){
                Text("Create")
                .padding(10)
                .frame(width: 100)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
            }

            Button(action: {
                
                contentViewModel.clear()
                hideKeyboard()
                
            }, label: {
                
                Text("Clear")
                .padding(10)
                .frame(width: 100)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(20)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
