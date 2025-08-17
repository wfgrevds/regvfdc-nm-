//
//  conversionpage7.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//

import SwiftUI

struct ConversionPage7: View {
    @State private var animateChart = false
    @State private var animateStars = false
    @State private var navigateToSleepPosition = false
    @State private var animateContent = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                // Dark blue gradient background with stars
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.05, green: 0.05, blue: 0.15),
                        Color(red: 0.1, green: 0.1, blue: 0.2)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                // Animated star field
                ForEach(0..<50, id: \.self) { _ in
                    Circle()
                        .fill(Color.white.opacity(0.3))
                        .frame(width: CGFloat.random(in: 1...3))
                        .position(
                            x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                            y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                        )
                        .opacity(animateStars ? 1 : 0)
                        .animation(.easeInOut(duration: 2).delay(Double.random(in: 0...2)), value: animateStars)
                }
                
                VStack(spacing: 20) {
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
                    
                    // Robot with heart eyes
                    VStack {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 15, height: 13)
                            .foregroundColor(.red)
                            .offset(x: -12, y: 20)
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 15, height: 13)
                            .foregroundColor(.red)
                            .offset(x: 12, y: 5)
                        
                        Image(systemName: "face.smiling")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 20)
                    
                    // Main headline
                    Text("We've helped 93% of users improve their sleep")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    // Chart section
                    VStack(alignment: .leading, spacing: 16) {
                        // Chart
                        ZStack {
                            // Chart background
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.black.opacity(0.3))
                                .frame(height: 250)
                            
                            VStack(spacing: 20) {
                                // "Your Ideal Sleep" label
                                HStack {
                                    Spacer()
                                    HStack {
                                        Text("Your Ideal Sleep")
                                            .font(.headline)
                                            .foregroundColor(Color.cyan)
                                        Image(systemName: "checkmark.seal.fill")
                                            .foregroundColor(Color.cyan)
                                    }
                                    .padding(.trailing, 30)
                                }
                                
                                // Chart curve
                                ChartView(animate: animateChart)
                                    .frame(height: 150)
                                
                                // Chart labels
                                HStack {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Sleep")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        Text("Quality")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.leading, 20)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Text("Time")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        HStack {
                                            ForEach(0..<10) { _ in
                                                Circle()
                                                    .fill(Color.gray)
                                                    .frame(width: 2, height: 2)
                                            }
                                            Image(systemName: "arrow.right")
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .padding(.trailing, 20)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        // Request improvement text
                        Text("Request improvement in just 3 days")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .padding(.leading, 20)
                    }
                    
                    Spacer()
                    
                    // Bottom text with statistics
                    VStack(spacing: 16) {
                        HStack {
                            Text("ShutEye partnered with top sleep experts and has already helped ")
                                .font(.body)
                                .foregroundColor(.white)
                            +
                            Text("over 1,000,000 users")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.cyan)
                            +
                            Text(" fall asleep faster, spend more time asleep, and wake up less during the night.")
                                .font(.body)
                                .foregroundColor(.white)
                        }
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        
                        // Continue button with navigation
                        NavigationLink(destination: conversionpage8(), isActive: $navigateToSleepPosition) {
                            EmptyView()
                        }
                        
                        Button(action: {
                            navigateToSleepPosition = true
                        }) {
                            HStack {
                                Spacer()
                                Image(systemName: "arrow.right")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(50)
                            .frame(width: 80, height: 80)
                        }
                        .padding(.bottom, 40)
                    }
                    
                    ConversionProgressBar(currentStep: 7, initialProgress: 6.0 / 17.0)
                }
                .opacity(animateContent ? 1.0 : 0.0)
                .scaleEffect(animateContent ? 1.0 : 0.95)
                .animation(.easeOut(duration: 0.8), value: animateContent)
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            withAnimation {
                animateContent = true
            }
            animateStars = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                animateChart = true
            }
        }
        .onDisappear {
            animateContent = false
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ChartView: View {
    let animate: Bool
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 40
            let height = geometry.size.height - 20
            
            ZStack {
                // Chart points
                let points = [
                    CGPoint(x: 0, y: height * 0.8),
                    CGPoint(x: width * 0.2, y: height * 0.6),
                    CGPoint(x: width * 0.4, y: height * 0.4),
                    CGPoint(x: width * 0.6, y: height * 0.25),
                    CGPoint(x: width * 0.8, y: height * 0.1),
                    CGPoint(x: width, y: height * 0.05)
                ]
                
                // Gradient fill under curve
                Path { path in
                    if animate {
                        path.move(to: CGPoint(x: 20, y: points[0].y + 10))
                        
                        for i in 0..<points.count {
                            let point = CGPoint(x: points[i].x + 20, y: points[i].y + 10)
                            if i == 0 {
                                path.move(to: point)
                            } else {
                                path.addLine(to: point)
                            }
                        }
                        
                        path.addLine(to: CGPoint(x: width + 20, y: height + 10))
                        path.addLine(to: CGPoint(x: 20, y: height + 10))
                        path.closeSubpath()
                    }
                }
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.cyan.opacity(0.3),
                            Color.cyan.opacity(0.1),
                            Color.clear
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .animation(.easeInOut(duration: 2), value: animate)
                
                // Main curve line
                Path { path in
                    if animate {
                        path.move(to: CGPoint(x: 20, y: points[0].y + 10))
                        
                        for i in 1..<points.count {
                            let point = CGPoint(x: points[i].x + 20, y: points[i].y + 10)
                            path.addLine(to: point)
                        }
                    }
                }
                .stroke(Color.cyan, lineWidth: 3)
                .animation(.easeInOut(duration: 2), value: animate)
                
                // Chart points
                ForEach(0..<points.count, id: \.self) { index in
                    if animate {
                        Circle()
                            .fill(Color.cyan)
                            .frame(width: 8, height: 8)
                            .position(
                                x: points[index].x + 20,
                                y: points[index].y + 10
                            )
                            .opacity(animate ? 1 : 0)
                            .animation(.easeInOut(duration: 1.5).delay(Double(index) * 0.2), value: animate)
                    }
                }
                
                // Final point with checkmark
                if animate {
                    ZStack {
                        Circle()
                            .fill(Color.cyan)
                            .frame(width: 20, height: 20)
                        
                        Image(systemName: "checkmark")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    .position(
                        x: points.last!.x + 20,
                        y: points.last!.y + 10
                    )
                    .opacity(animate ? 1 : 0)
                    .animation(.easeInOut(duration: 1).delay(2), value: animate)
                }
            }
        }
    }
}

#Preview {
    ConversionPage7()
}
