//
//  conversionprogressbar.swift
//  napzz
//
//  Created by Morris Romagnoli on 11/08/2025.
//

import SwiftUI

struct ConversionProgressBar: View {
    let currentStep: Int
    let totalSteps: Int = 17
    let initialProgress: Double
    
    @State private var displayedProgress: Double = 0
    
    private var targetProgress: Double {
        return Double(currentStep) / Double(totalSteps)
    }
    
    // Convenience initializer for backward compatibility
    init(currentStep: Int) {
        self.currentStep = currentStep
        self.initialProgress = max(0, Double(currentStep - 1) / 17.0)
    }
    
    // New initializer with explicit initial progress
    init(currentStep: Int, initialProgress: Double) {
        self.currentStep = currentStep
        self.initialProgress = initialProgress
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Progress bar container
            ZStack(alignment: .leading) {
                // Background bar - made thicker
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.white.opacity(0.2))
                    .frame(height: 6)
                
                // Progress fill - uniform light blue with smooth animation, made thicker
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color(red: 0.4, green: 0.7, blue: 1.0)) // Light blue color
                    .frame(width: UIScreen.main.bounds.width * 0.9 * displayedProgress, height: 6)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 30)
        .padding(.top, 10)
        .onAppear {
            // Start from initial progress and animate to target
            displayedProgress = initialProgress
            withAnimation(.easeInOut(duration: 1.2)) {
                displayedProgress = targetProgress
            }
        }
        .onChange(of: currentStep) { _ in
            // Smoothly animate to new progress when step changes
            withAnimation(.easeInOut(duration: 1.2)) {
                displayedProgress = targetProgress
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        
        VStack {
            Spacer()
            ConversionProgressBar(currentStep: 5, initialProgress: 4.0 / 17.0)
        }
    }
}
