//
//  conversionpage6.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//
import SwiftUI

struct ConversionPage6: View {
    // Closure for navigation, if needed
    var onNext: (() -> Void)?
    @State private var animateContent = false
    @State private var navigateToNext = false
    @Environment(\.presentationMode) var presentationMode
    
    let options: [(String, String)] = [
        ("😩", "Always"),
        ("😣", "Usually"),
        ("🤔", "Sometimes"),
        ("😊", "Rarely")
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
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
                .padding(.top, 10)
                
                VStack(spacing: 24) {
                // Robot image (replace with your asset if you have one)
                Image(systemName: "face.smiling")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Text("How often do you wake up tired in the morning?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                ForEach(options, id: \.1) { emoji, label in
                    Button(action: {
                        navigateToNext = true
                    }) {
                        HStack {
                            Text(emoji)
                                .font(.title2)
                            Text(label)
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding(.leading, 4)
                            Spacer()
                        }
                        .padding()
                        .background(Color(red: 32/255, green: 33/255, blue: 36/255))
                        .cornerRadius(18)
                    }
                    .padding(.horizontal)
                }
                Spacer()
                }
                .opacity(animateContent ? 1.0 : 0.0)
                .scaleEffect(animateContent ? 1.0 : 0.95)
                .animation(.easeOut(duration: 0.8), value: animateContent)
                
                ConversionProgressBar(currentStep: 6, initialProgress: 5.0 / 17.0)
            }
        }
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $navigateToNext) {
            ConversionPage7()
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
