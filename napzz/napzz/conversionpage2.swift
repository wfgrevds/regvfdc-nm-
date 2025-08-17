//
//  conversionpage2.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//


import SwiftUI

struct ConversionPage2: View {
    let onNext: () -> Void
    @State private var animateContent = false
    @Environment(\.presentationMode) var presentationMode

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
                Image(systemName: "moon.stars.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
                    .padding(.top, 40)

                Text("What time do you usually go to bed?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                ForEach(["Before 10 PM", "10-11 PM", "11 PM - Midnight", "After Midnight"], id: \.self) { option in
                    Button(action: {
                        onNext()
                    }) {
                        HStack {
                            Text(option)
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
                
                ConversionProgressBar(currentStep: 2, initialProgress: 1.0 / 17.0)
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    animateContent = true
                }
            }
        }
        .onDisappear {
            animateContent = false
        }
    }
}
