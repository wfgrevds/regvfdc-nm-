//
//  ContentView.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//


import SwiftUI



struct WelcomeView: View {
    var body: some View {
        ZStack {
            Color(red: 10/255, green: 25/255, blue: 50/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Welcome to Napz")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Relax, listen, and sleep better.")
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.8))
                
                Image(systemName: "moon.stars.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.white.opacity(0.7))
                
                Spacer()
                
                // NavigationLink to RoutineView
                NavigationLink(destination: RoutineView()) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .padding(.bottom, 40)
            }
            .padding()
        }
    }
}

import SwiftUI
struct xContentView: View {
    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            RoutineView()
                .tabItem {
                    Image(systemName: "moon.zzz.fill")
                    Text("Routine")
                }
                .tag(0)

            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(1)
        }
    }
}


struct ContentView: View {
    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            RoutineView()
                .tabItem {
                    Image(systemName: "moon.zzz.fill")
                    Text("Routine")
                }
                .tag(0)

            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeViewController()
    }
}
