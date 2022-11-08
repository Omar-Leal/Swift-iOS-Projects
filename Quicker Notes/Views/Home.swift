//
//  Home.swift
//  Quicker Notes
//
//  Created by Omar Leal on 11/4/22.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        HStack {
            
            if isMacOs() {
                SideBar()
            }
            
        }
        .frame(width: isMacOs() ? getRect().width / 1.7 : nil,
               height: isMacOs() ? getRect().height - 180 : nil)
        .background(Color(.lightGray).ignoresSafeArea())
        .preferredColorScheme(.light)
    }
    
    @ViewBuilder
    func SideBar() -> some View {
        VStack {
            Text("Pocket")
                .font(.title2)
                .fontWeight(.semibold)
            AddButton()
        }
    }
    
    @ViewBuilder
    func AddButton() -> some View {
        Button {
            
        } label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundColor(.white)
                .padding(isMacOs() ? 12 : 15)
                .background(Color.black)
                .clipShape(Circle())
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}


extension View {
    func getRect() -> CGRect {
        #if os(iOS)
        return UIScreen.main.bounds
        #else
        return NSScreen.main!.visibleFrame
        #endif
    }
    
    func isMacOs() -> Bool {
         #if os(iOS)
        return false
        #endif
        return true
    }
    
}
