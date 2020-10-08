//
//  ContentView.swift
//  SwiftUIShareSheet
//
//  Created by Alexander Römer on 08.10.20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var items: [Any] = []
    @State private var showSheet = false
        
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button(action: {
                    items.removeAll()
                    items.append(UIImage(named: "pic")!)
                    showSheet.toggle()
                }, label: {
                    Text("Share")
                })
            }
        }
        .sheet(isPresented: $showSheet, content: {
            ShareSheet(items: items)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
