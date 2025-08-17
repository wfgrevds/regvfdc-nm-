//
//  conversionpage10.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//

import SwiftUI

struct ConversionPage10: View {
    @State private var animateCards = false
    @State private var animateArrow = false
    @State private var navigateToNext = false
    @State private var animateContent = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // Dark background with gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.blue.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header with back button and robot
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                }
                .padding(.top, 10)
                
                // Robot icon
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 80, height: 80)
                    
                    VStack(spacing: 4) {
                        // Robot eyes
                        HStack(spacing: 10) {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 8, height: 8)
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 8, height: 8)
                        }
                        
                        // Robot mouth
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray)
                            .frame(width: 20, height: 4)
                    }
                }
                .padding(.top, 20)
                
                // Title
                Text("You are in the right place to sleep better with good habits")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                
                Spacer()
                
                // Cards section
                HStack(spacing: 20) {
                    // "No" card (bad habits)
                    VStack(spacing: 0) {
                        // Card header
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray.opacity(0.8))
                                .frame(height: 80)
                            
                            Text("No")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        
                        // Card content
                        VStack(spacing: 12) {
                            BadHabitRow(text: "Stay up late")
                            BadHabitRow(text: "Blue Light")
                            BadHabitRow(text: "Too much coffee")
                            BadHabitRow(text: "Wet hair")
                            BadHabitRow(text: "Heavy food")
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray.opacity(0.6))
                        )
                        
                        // Woman image placeholder
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray.opacity(0.4))
                                .frame(height: 120)
                            
                            // Placeholder for tired woman image
                            VStack {
                                Image(systemName: "person.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.white.opacity(0.7))
                                Text("Tired")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.7))
                            }
                        }
                    }
                    .scaleEffect(animateCards ? 1.0 : 0.8)
                    .opacity(animateCards ? 1.0 : 0.0)
                    .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.1), value: animateCards)
                    
                    // Arrow
                    VStack {
                        Spacer()
                        Image(systemName: "arrow.right")
                            .font(.title)
                            .foregroundColor(.white)
                            .scaleEffect(animateArrow ? 1.2 : 1.0)
                            .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: animateArrow)
                        Spacer()
                    }
                    .frame(width: 40)
                    
                    // "Yes" card (good habits)
                    VStack(spacing: 0) {
                        // Card header
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.blue)
                                .frame(height: 80)
                            
                            Text("Yes")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        
                        // Card content
                        VStack(spacing: 12) {
                            GoodHabitRow(text: "Same sleep time")
                            GoodHabitRow(text: "Dark room")
                            GoodHabitRow(text: "Cool temperature")
                            GoodHabitRow(text: "Relax Bath")
                            GoodHabitRow(text: "Comfort bed")
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.blue.opacity(0.8))
                        )
                        
                        // Sleeping woman image placeholder
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.blue.opacity(0.6))
                                .frame(height: 120)
                            
                            // Placeholder for sleeping woman image
                            VStack {
                                Image(systemName: "bed.double.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                Text("Peaceful Sleep")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .scaleEffect(animateCards ? 1.0 : 0.8)
                    .opacity(animateCards ? 1.0 : 0.0)
                    .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.3), value: animateCards)
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Continue button
                Button(action: {
                    navigateToNext = true
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 60, height: 60)
                        
                        Image(systemName: "arrow.right")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 40)
                .scaleEffect(animateCards ? 1.0 : 0.8)
                .opacity(animateCards ? 1.0 : 0.0)
                .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.5), value: animateCards)
                
                // Navigation link - Updated to navigate to the new page
                NavigationLink(
                    destination: conversionpage11(),
                    isActive: $navigateToNext,
                    label: { EmptyView() }
                )
                .hidden()
            }
            
            ConversionProgressBar(currentStep: 10, initialProgress: 9.0 / 17.0)
        }
        .opacity(animateContent ? 1.0 : 0.0)
        .scaleEffect(animateContent ? 1.0 : 0.95)
        .animation(.easeOut(duration: 0.8), value: animateContent)
        .navigationBarHidden(true)
        .onAppear {
            withAnimation {
                animateContent = true
                animateCards = true
                animateArrow = true
            }
        }
        .onDisappear {
            animateContent = false
        }
    }
}

struct BadHabitRow: View {
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .font(.caption)
                .foregroundColor(.white)
            
            Text(text)
                .font(.body)
                .foregroundColor(.white)
            
            Spacer()
        }
    }
}

struct GoodHabitRow: View {
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark")
                .font(.caption)
                .foregroundColor(.white)
            
            Text(text)
                .font(.body)
                .foregroundColor(.white)
            
            Spacer()
        }
    }
}

#Preview {
    NavigationView {
        ConversionPage10()
    }
}
