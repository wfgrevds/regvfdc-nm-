//
//  conversionpage1.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//
import SwiftUI

struct ConversionPage1: View {
    @State private var goToNextPage = false
    @State private var animateContent = false

    let options = [
        ("😄", "Very satisfied"),
        ("😐", "Neutral"),
        ("😕", "Unsatisfied"),
        ("😫", "Very Unsatisfied")
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack(spacing: 0) {
                    VStack(spacing: 24) {
                    // Robot image at the top (replace with your asset if needed)
                    Image(systemName: "face.smiling") // Replace with your robot image if you have one
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                    
                    Text("How satisfied are you with your sleep?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    ForEach(options, id: \.1) { emoji, text in
                        Button(action: {
                            goToNextPage = true
                        }) {
                            HStack {
                                Text(emoji)
                                    .font(.largeTitle)
                                Text(text)
                                    .foregroundColor(.white)
                                    .font(.headline)
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
                    
                    ConversionProgressBar(currentStep: 1)
                }
                // Navigation to next page
                .navigationDestination(isPresented: $goToNextPage) {
                    ConversionPage2()
                }
            }
            .navigationBarHidden(true)
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

