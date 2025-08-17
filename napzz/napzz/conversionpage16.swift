//
//  conversionpage16.swift
//  napzz
//
//  Created by Morris Romagnoli on 05/07/2025.
//

import SwiftUI

struct ConversionPage16: View {
    @State private var animateCards = false
    @State private var selectedReview: Int? = nil
    @State private var navigateToNext = false
    @State private var animateContent = false
    @Environment(\.presentationMode) var presentationMode
    
    let reviews = [
        Review(
            name: "Big3",
            date: "2023-02-12",
            rating: 5,
            text: "Hope you sleep please write music and also you can do everything else and also.."
        ),
        Review(
            name: "Sarah M.",
            date: "2024-01-15",
            rating: 5,
            text: "Amazing app! Finally found something that helps me fall asleep faster. The sounds are so relaxing."
        ),
        Review(
            name: "Mike J.",
            date: "2023-12-08",
            rating: 4,
            text: "Great variety of sounds. The sleep tracking feature is really helpful to understand my patterns."
        ),
        Review(
            name: "Emma L.",
            date: "2024-02-20",
            rating: 5,
            text: "Life changing! I've been using this for months now and my sleep quality has improved dramatically."
        )
    ]
    
    var body: some View {
        ZStack {
            // Space background
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.blue.opacity(0.3)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Earth at bottom
            VStack {
                Spacer()
                
                // Earth image
                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.green.opacity(0.6), Color.blue.opacity(0.9)]),
                                center: .center,
                                startRadius: 50,
                                endRadius: 200
                            )
                        )
                        .frame(width: 400, height: 400)
                        .blur(radius: 2)
                    
                    // Earth details
                    Circle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [Color.cyan.opacity(0.3), Color.blue.opacity(0.8)]),
                                center: .topLeading,
                                startRadius: 20,
                                endRadius: 180
                            )
                        )
                        .frame(width: 380, height: 380)
                        .overlay(
                            // Landmasses simulation
                            VStack {
                                HStack {
                                    Circle()
                                        .fill(Color.green.opacity(0.7))
                                        .frame(width: 40, height: 40)
                                        .offset(x: -60, y: -20)
                                    
                                    Spacer()
                                    
                                    Circle()
                                        .fill(Color.green.opacity(0.6))
                                        .frame(width: 60, height: 60)
                                        .offset(x: 30, y: 40)
                                }
                                Spacer()
                                HStack {
                                    Circle()
                                        .fill(Color.green.opacity(0.5))
                                        .frame(width: 80, height: 80)
                                        .offset(x: -40, y: 20)
                                    
                                    Spacer()
                                }
                            }
                        )
                }
                .offset(y: 150)
            }
            
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
                    Text("Millions of Users' Choice")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.orange)
                        .opacity(animateCards ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.8).delay(0.2), value: animateCards)
                    
                    Text("All you need about sleep, it's all in ShutEye")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .opacity(animateCards ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.8).delay(0.4), value: animateCards)
                }
                .padding(.bottom, 30)
                
                // Rating section
                VStack(spacing: 15) {
                    // 5 stars
                    HStack(spacing: 8) {
                        ForEach(0..<5, id: \.self) { index in
                            Image(systemName: "star.fill")
                                .font(.title2)
                                .foregroundColor(.yellow)
                                .scaleEffect(animateCards ? 1.0 : 0.5)
                                .opacity(animateCards ? 1.0 : 0.0)
                                .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(Double(index) * 0.1 + 0.8), value: animateCards)
                        }
                    }
                    
                    // Rating badge
                    VStack(spacing: 8) {
                        HStack(spacing: 15) {
                            // Left laurel
                            Image(systemName: "leaf.fill")
                                .font(.title)
                                .foregroundColor(.yellow)
                                .rotationEffect(.degrees(-45))
                            
                            VStack(spacing: 2) {
                                Text("4.8")
                                    .font(.system(size: 48, weight: .bold))
                                    .foregroundColor(.yellow)
                                
                                Text("High-Rated App")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text("2024")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            // Right laurel
                            Image(systemName: "leaf.fill")
                                .font(.title)
                                .foregroundColor(.yellow)
                                .rotationEffect(.degrees(45))
                        }
                        
                        // Laurel wreath bottom
                        HStack(spacing: 4) {
                            ForEach(0..<8, id: \.self) { _ in
                                Image(systemName: "leaf.fill")
                                    .font(.caption)
                                    .foregroundColor(.yellow.opacity(0.8))
                            }
                        }
                        .rotationEffect(.degrees(180))
                    }
                    .scaleEffect(animateCards ? 1.0 : 0.8)
                    .opacity(animateCards ? 1.0 : 0.0)
                    .animation(.spring(response: 0.8, dampingFraction: 0.8).delay(1.0), value: animateCards)
                }
                .padding(.vertical, 20)
                
                // Reviews section
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(Array(reviews.enumerated()), id: \.offset) { index, review in
                            ReviewCard(
                                review: review,
                                isSelected: selectedReview == index,
                                onTap: {
                                    selectedReview = index
                                    let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                                    impactFeedback.impactOccurred()
                                }
                            )
                            .scaleEffect(animateCards ? 1.0 : 0.8)
                            .opacity(animateCards ? 1.0 : 0.0)
                            .animation(
                                .spring(response: 0.6, dampingFraction: 0.8)
                                .delay(Double(index) * 0.1 + 1.2),
                                value: animateCards
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 200) // Extra space for Earth and button
                }
                
                Spacer()
            }
            
            // Floating continue button
            VStack {
                Spacer()
                
                Button(action: {
                    let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                    impactFeedback.impactOccurred()
                    
                    navigateToNext = true
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
                .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(1.5), value: animateCards)
                .padding(.bottom, 50)
            }
            
            // Navigation link (invisible)
            NavigationLink(
                destination: ConversionPage17(), // Replace with your next page
                isActive: $navigateToNext,
                label: { EmptyView() }
            )
            .hidden()
        }
        
        .opacity(animateContent ? 1.0 : 0.0)
        .scaleEffect(animateContent ? 1.0 : 0.95)
        .animation(.easeOut(duration: 0.8), value: animateContent)
        
        ConversionProgressBar(currentStep: 16, initialProgress: 15.0 / 17.0)
        .navigationBarHidden(true)
        .onAppear {
            withAnimation {
                animateContent = true
            }
            animateCards = true
        }
        .onDisappear {
            animateContent = false
        }
    }
}

struct Review {
    let name: String
    let date: String
    let rating: Int
    let text: String
}

struct ReviewCard: View {
    let review: Review
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 15) {
                // Avatar
                Circle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 50, height: 50)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                    )
                
                // Review content
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(review.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text(review.date)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    // Star rating
                    HStack(spacing: 2) {
                        ForEach(0..<5, id: \.self) { index in
                            Image(systemName: index < review.rating ? "star.fill" : "star")
                                .font(.caption)
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    Text(review.text)
                        .font(.body)
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
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
        ConversionPage16()
    }
}
