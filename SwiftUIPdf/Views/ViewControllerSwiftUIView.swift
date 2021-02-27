//
//  ViewControllerSwiftUIView.swift
//  SwiftUIPdf
//
//  Created by Chee Ket Yung on 23/02/2021.
//

import SwiftUI


struct ViewControllerSwiftUIView: UIViewControllerRepresentable {

   
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerSwiftUIView>) -> ViewController {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewController,
                                context: UIViewControllerRepresentableContext<ViewControllerSwiftUIView>) {

    }
}
