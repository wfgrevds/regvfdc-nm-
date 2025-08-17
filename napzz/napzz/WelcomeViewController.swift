//
//  WelcomeViewController.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//

import SwiftUI

struct WelcomeViewController: View {
    @State private var goToNextPage = false
    @State private var animateContent = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Gradient background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.2, green: 0.3, blue: 0.6),
                        Color(red: 0.3, green: 0.2, blue: 0.5)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                // Twinkling stars
                ForEach(0..<100, id: \.self) { _ in
                    Circle()
                        .fill(Color.white.opacity(Double.random(in: 0.1...0.5)))
                        .frame(width: CGFloat.random(in: 1...3), height: CGFloat.random(in: 1...3))
                        .position(
                            x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                            y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                        )
                        .opacity(animateContent ? Double.random(in: 0.3...1.0) : 0)
                        .animation(.easeInOut(duration: Double.random(in: 1.0...3.0)).repeatForever(autoreverses: true), value: animateContent)
                }
                
                // Foliage at the bottom
                VStack {
                    Spacer()
                    ZStack {
                        // Multiple layers of foliage
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color(red: 0.15, green: 0.1, blue: 0.25).opacity(0.8))
                            .frame(width: UIScreen.main.bounds.width * 1.2, height: 200)
                            .offset(x: -20, y: 0)
                            .rotationEffect(.degrees(-5))
                        
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(red: 0.2, green: 0.15, blue: 0.3).opacity(0.7))
                            .frame(width: UIScreen.main.bounds.width * 1.1, height: 180)
                            .offset(x: 30, y: -10)
                            .rotationEffect(.degrees(3))
                        
                        RoundedRectangle(cornerRadius: 60)
                            .fill(Color(red: 0.25, green: 0.2, blue: 0.35).opacity(0.6))
                            .frame(width: UIScreen.main.bounds.width * 1.3, height: 220)
                            .offset(x: 0, y: 20)
                            .rotationEffect(.degrees(-2))
                        
                        // Additional organic shapes for leaves
                        ForEach(0..<15, id: \.self) { _ in
                            Ellipse()
                                .fill(Color(red: 0.3, green: 0.25, blue: 0.4).opacity(Double.random(in: 0.3...0.7)))
                                .frame(
                                    width: CGFloat.random(in: 30...80),
                                    height: CGFloat.random(in: 15...40)
                                )
                                .rotationEffect(.degrees(Double.random(in: -45...45)))
                                .offset(
                                    x: CGFloat.random(in: -150...150),
                                    y: CGFloat.random(in: -50...50)
                                )
                        }
                    }
                    .offset(y: 150)
                }
                
                // Main content
                VStack(spacing: 30) {
                    Spacer()
                    
                    // Logo
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 80, height: 80)
                        
                        ZStack {
                            Image(systemName: "sparkles")
                                .font(.system(size: 30))
                                .foregroundColor(Color(red: 0.2, green: 0.3, blue: 0.6))
                            
                            Image(systemName: "leaf.fill")
                                .font(.system(size: 30))
                                .foregroundColor(Color(red: 0.2, green: 0.3, blue: 0.6))
                                .offset(x: -10, y: 10)
                        }
                    }
                    .padding(.bottom, 10)
                    
                    // App name
                    Text("elevatedsleep")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    // Tagline
                    Text("Start your dreamy nights from here")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                    
                    Spacer()
                    
                    // Get Started button
                    Button(action: {
                        goToNextPage = true
                    }) {
                        Text("Get Started")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 60)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(red: 0.3, green: 0.15, blue: 0.6))
                            )
                    }
                    .padding(.bottom, 20)
                    
                    // Made by section
                    VStack(spacing: 8) {
                        Text("Made by")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                        
                        HStack(spacing: 8) {
                            Text("E L E V A T E D S L E E P")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white.opacity(0.8))
                            
                            Image(systemName: "infinity")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                    .padding(.bottom, 40)
                }
                .opacity(animateContent ? 1.0 : 0.0)
                .scaleEffect(animateContent ? 1.0 : 0.95)
                .animation(.easeOut(duration: 0.8), value: animateContent)
            }
            .navigationDestination(isPresented: $goToNextPage) {
                ConversionPage1()
            }
        }
        .onAppear {
            withAnimation {
                animateContent = true
            }
        }
        .onDisappear {
            animateContent = false
        }
    }
}
