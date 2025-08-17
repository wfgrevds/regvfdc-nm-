//
//  conversionpage14.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//


import SwiftUI

struct ConversionPage14: View {
    let onNext: () -> Void
    @State private var animateCards = false
    @State private var selectedCard: Int? = nil
    @State private var animateContent = false
    @Environment(\.presentationMode) var presentationMode
    
    let sleepEvents = [
        SleepEvent(
            title: "You Snored",
            time: "11:26 pm",
            avatar: "👱‍♀️",
            isHighlighted: false
        ),
        SleepEvent(
            title: "You Gasped",
            time: "11:46 pm",
            avatar: "👱‍♀️",
            isHighlighted: true
        ),
        SleepEvent(
            title: "You Talked",
            time: "00:23 am",
            avatar: "👱‍♀️",
            isHighlighted: false
        ),
        SleepEvent(
            title: "You Snored",
            time: "12:47 am",
            avatar: "👱‍♀️",
            isHighlighted: false
        ),
        SleepEvent(
            title: "You Gasped",
            time: "01:15 am",
            avatar: "👱‍♀️",
            isHighlighted: false
        ),
        SleepEvent(
            title: "You Talked",
            time: "02:33 am",
            avatar: "👱‍♀️",
            isHighlighted: false
        )
    ]
    
    var body: some View {
        ZStack {
            // Dark background with gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.blue.opacity(0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
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
                .padding(.top, 10)
                
                // Header
                VStack(spacing: 8) {
                    Text("Accurate Sleep Recorder")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.orange)
                        .opacity(animateCards ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.8).delay(0.2), value: animateCards)
                    
                    Text("Find out what you did in your sleep!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .opacity(animateCards ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.8).delay(0.4), value: animateCards)
                }
                .padding(.bottom, 40)
                
                // Scrollable sleep events
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(Array(sleepEvents.enumerated()), id: \.offset) { index, event in
                            SleepEventCard(
                                event: event,
                                isSelected: selectedCard == index,
                                onTap: {
                                    selectedCard = index
                                    // Add haptic feedback
                                    let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                                    impactFeedback.impactOccurred()
                                }
                            )
                            .scaleEffect(animateCards ? 1.0 : 0.8)
                            .opacity(animateCards ? 1.0 : 0.0)
                            .animation(
                                .spring(response: 0.6, dampingFraction: 0.8)
                                .delay(Double(index) * 0.1 + 0.6),
                                value: animateCards
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 120) // Extra space for button
                }
                
                Spacer()
            }
            
            // Floating continue button
            VStack {
                Spacer()
                
                Button(action: {
                    let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                    impactFeedback.impactOccurred()
                    
                    onNext()
                }) {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: "arrow.right")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        )
                        .shadow(color: Color.blue.opacity(0.3), radius: 8, x: 0, y: 4)
                }
                .scaleEffect(animateCards ? 1.0 : 0.8)
                .opacity(animateCards ? 1.0 : 0.0)
                .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(1.2), value: animateCards)
                .padding(.bottom, 50)
            }
            
        }
        
        .opacity(animateContent ? 1.0 : 0.0)
        .scaleEffect(animateContent ? 1.0 : 0.95)
        .animation(.easeOut(duration: 0.8), value: animateContent)
        
        ConversionProgressBar(currentStep: 14, initialProgress: 13.0 / 17.0)
        .navigationBarHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    animateContent = true
                }
            }
            animateCards = true
        }
        .onDisappear {
            animateContent = false
        }
    }
}

struct SleepEvent {
    let title: String
    let time: String
    let avatar: String
    let isHighlighted: Bool
}

struct SleepEventCard: View {
    let event: SleepEvent
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 20) {
                // Avatar
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 60, height: 60)
                    
                    // 3D-style avatar with blonde hair
                    VStack(spacing: 2) {
                        // Hair
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.yellow.opacity(0.8))
                            .frame(width: 35, height: 20)
                        
                        // Face
                        Circle()
                            .fill(Color.pink.opacity(0.8))
                            .frame(width: 30, height: 30)
                            .overlay(
                                VStack(spacing: 1) {
                                    // Eyes (closed)
                                    HStack(spacing: 4) {
                                        RoundedRectangle(cornerRadius: 1)
                                            .fill(Color.black)
                                            .frame(width: 4, height: 1)
                                        RoundedRectangle(cornerRadius: 1)
                                            .fill(Color.black)
                                            .frame(width: 4, height: 1)
                                    }
                                    .padding(.top, 4)
                                    
                                    // Mouth
                                    RoundedRectangle(cornerRadius: 1)
                                        .fill(Color.red.opacity(0.7))
                                        .frame(width: 6, height: 2)
                                        .padding(.top, 2)
                                }
                            )
                    }
                }
                
                // Event details
                VStack(alignment: .leading, spacing: 4) {
                    Text(event.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(event.time)
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    // Sound wave visualization
                    HStack(spacing: 2) {
                        ForEach(0..<25, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 1)
                                .fill(Color.gray.opacity(0.6))
                                .frame(width: 2, height: CGFloat.random(in: 4...12))
                        }
                    }
                    .padding(.top, 4)
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(event.isHighlighted ? Color.blue.opacity(0.2) : Color.gray.opacity(0.15))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                event.isHighlighted ? Color.blue.opacity(0.5) : Color.clear,
                                lineWidth: event.isHighlighted ? 2 : 0
                            )
                    )
            )
            .scaleEffect(isSelected ? 1.02 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    NavigationView {
        ConversionPage14()
    }
}

