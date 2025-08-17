//
//  conversionpage12.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//
import SwiftUI

struct conversionpage12: View {
    @State private var selectedAnswer: String? = nil
    @State private var animateOptions = false
    @State private var navigateToNext = false
    @State private var animateContent = false
    @Environment(\.presentationMode) var presentationMode
    
    let answers = [
        ("🚫", "None"),
        ("😴", "Sleep apnea"),
        ("🦵", "Restless legs syndrome"),
        ("😪", "Narcolepsy")
    ]
    
    var body: some View {
        ZStack {
            // Dark background
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header with back button
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
                .padding(.top, 30)
                
                // Title
                Text("Have you been diagnosed with any of the following?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .padding(.top, 40)
                
                Spacer()
                
                // Answer options
                VStack(spacing: 20) {
                    ForEach(Array(answers.enumerated()), id: \.offset) { index, answer in
                        DiagnosisAnswerButton(
                            emoji: answer.0,
                            text: answer.1,
                            isSelected: selectedAnswer == answer.1,
                            action: {
                                selectedAnswer = answer.1
                                // Add haptic feedback
                                let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                                impactFeedback.impactOccurred()
                            }
                        )
                        .scaleEffect(animateOptions ? 1.0 : 0.8)
                        .opacity(animateOptions ? 1.0 : 0.0)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(Double(index) * 0.1), value: animateOptions)
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Spacer()
                
                // Navigation link (invisible)
                NavigationLink(
                    destination: conversionpage13(), // Navigate to loading screen
                    isActive: $navigateToNext,
                    label: { EmptyView() }
                )
                .hidden()
            }
            
            ConversionProgressBar(currentStep: 12, initialProgress: 11.0 / 17.0)
        }
        .opacity(animateContent ? 1.0 : 0.0)
        .scaleEffect(animateContent ? 1.0 : 0.95)
        .animation(.easeOut(duration: 0.8), value: animateContent)
        .navigationBarHidden(true)
        .onAppear {
            withAnimation {
                animateContent = true
            }
            animateOptions = true
        }
        .onDisappear {
            animateContent = false
        }
        .onChange(of: selectedAnswer) { answer in
            if answer != nil {
                // Auto-navigate after a short delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    navigateToNext = true
                }
            }
        }
    }
}

struct DiagnosisAnswerButton: View {
    let emoji: String
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 15) {
                // Special handling for the leg emoji to make it more visible
                if emoji == "🦵" {
                    Text("🦵")
                        .font(.title2)
                        .foregroundColor(.yellow)
                } else {
                    Text(emoji)
                        .font(.title2)
                }
                
                Text(text)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(isSelected ? Color.blue : Color.gray.opacity(0.3))
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(isSelected ? Color.blue.opacity(0.8) : Color.clear, lineWidth: 2)
                    )
            )
            .scaleEffect(isSelected ? 1.05 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isSelected)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    NavigationView {
        conversionpage12()
    }
}
