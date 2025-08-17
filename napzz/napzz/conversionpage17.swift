import SwiftUI

struct ConversionPage17: View {
    let onNext: () -> Void
    @State private var animateContent = false
    @State private var selectedPlan = 0 // 0 for yearly, 1 for monthly
    @Environment(\.presentationMode) var presentationMode
    
    let features = [
        "Unlimited sleep sounds",
        "Advanced sleep recorder",
        "Personalized sleep insights",
        "Premium meditation content",
        "Sleep goal tracking",
        "Export sleep data"
    ]
    
    let sleepCards = [
        SleepCard(title: "You Snored!", time: "11:45 PM", type: .snore),
        SleepCard(title: "You Farted!", time: "03:05 AM", type: .fart),
        SleepCard(title: "You Talked!", time: "05:20 AM", type: .talk)
    ]
    
    var body: some View {
        ZStack {
            // Dark background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black,
                    Color.blue.opacity(0.1),
                    Color.black
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 0) {
                    // Header section
                    VStack(spacing: 20) {
                        // Close and Restore buttons
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "xmark")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                // Handle restore purchases
                            }) {
                                Text("Restore")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        // Main title
                        VStack(spacing: 12) {
                            Text("Just ShutEye, and sleep well")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            Text("Get access to premium features! Unlimited sleep sounds, a sleep recorder, and more are waiting for you.")
                                .font(.body)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                        }
                        .opacity(animateContent ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.8).delay(0.2), value: animateContent)
                    }
                    .padding(.bottom, 30)
                    
                    // Sleep cards carousel
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(Array(sleepCards.enumerated()), id: \.offset) { index, card in
                                SleepCardView(card: card)
                                    .scaleEffect(animateContent ? 1.0 : 0.8)
                                    .opacity(animateContent ? 1.0 : 0.0)
                                    .animation(
                                        .spring(response: 0.6, dampingFraction: 0.8)
                                        .delay(Double(index) * 0.1 + 0.4),
                                        value: animateContent
                                    )
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 40)
                    
                    // Page indicators
                    HStack(spacing: 8) {
                        ForEach(0..<4, id: \.self) { index in
                            Circle()
                                .fill(index == 1 ? Color.white : Color.gray.opacity(0.5))
                                .frame(width: 8, height: 8)
                        }
                    }
                    .padding(.bottom, 40)
                    
                    // Subscription plans
                    VStack(spacing: 16) {
                        // Yearly plan (recommended)
                        SubscriptionPlanView(
                            title: "7-Day Free Trial",
                            subtitle: "Then kr.499/year (only kr.41.58/month)",
                            badge: "No Payment Now",
                            isSelected: selectedPlan == 0,
                            isRecommended: true
                        ) {
                            selectedPlan = 0
                            let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                            impactFeedback.impactOccurred()
                        }
                        
                        // Monthly plan
                        SubscriptionPlanView(
                            title: "1 month kr. 89",
                            subtitle: "",
                            badge: "",
                            isSelected: selectedPlan == 1,
                            isRecommended: false
                        ) {
                            selectedPlan = 1
                            let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                            impactFeedback.impactOccurred()
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                    .opacity(animateContent ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 0.8).delay(0.8), value: animateContent)
                    
                    // Continue button
                    Button(action: {
                        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                        impactFeedback.impactOccurred()
                        
                        // Handle subscription purchase
                        onNext()
                    }) {
                        Text("Continue")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.blue)
                            )
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    .opacity(animateContent ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 0.8).delay(1.0), value: animateContent)
                    
                    // Terms and Privacy
                    VStack(spacing: 8) {
                        HStack {
                            Button(action: {
                                // Handle terms of service
                            }) {
                                Text("Terms of Service")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .underline()
                            }
                            
                            Text(" & ")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Button(action: {
                                // Handle privacy policy
                            }) {
                                Text("Privacy Policy")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .underline()
                            }
                        }
                        
                        Text("Please NOTE: After your 7-day free trial, your Apple ID payment method will be automatically charged.")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 30)
                    .opacity(animateContent ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 0.8).delay(1.2), value: animateContent)
                    
                    ConversionProgressBar(currentStep: 17, initialProgress: 16.0 / 17.0)
                }
            }
        }
        .opacity(animateContent ? 1.0 : 0.0)
        .scaleEffect(animateContent ? 1.0 : 0.95)
        .animation(.easeOut(duration: 0.8), value: animateContent)
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

struct SleepCard {
    let title: String
    let time: String
    let type: SleepCardType
}

enum SleepCardType {
    case snore, fart, talk
    
    var color: Color {
        switch self {
        case .snore: return .purple
        case .fart: return .pink
        case .talk: return .blue
        }
    }
    
    var waveformColor: Color {
        switch self {
        case .snore: return .purple.opacity(0.8)
        case .fart: return .pink.opacity(0.8)
        case .talk: return .blue.opacity(0.8)
        }
    }
}

struct SleepCardView: View {
    let card: SleepCard
    
    private var headGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.gray.opacity(0.3),
                Color.gray.opacity(0.6),
                Color.gray.opacity(0.4)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    private var eyeView: some View {
        HStack(spacing: 20) {
            Circle()
                .fill(Color.black.opacity(0.6))
                .frame(width: 8, height: 8)
            Circle()
                .fill(Color.black.opacity(0.6))
                .frame(width: 8, height: 8)
        }
        .padding(.top, 30)
    }
    
    private var noseView: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(Color.black.opacity(0.4))
            .frame(width: 3, height: 8)
    }
    
    private var mouthView: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(Color.black.opacity(0.4))
            .frame(width: 16, height: 4)
            .padding(.top, 8)
    }
    
    private var faceFeatures: some View {
        VStack(spacing: 8) {
            eyeView
            noseView
            mouthView
            Spacer()
        }
    }
    
    private var headSilhouette: some View {
        Ellipse()
            .fill(headGradient)
            .frame(width: 120, height: 140)
            .overlay(faceFeatures)
            .shadow(color: Color.black.opacity(0.3), radius: 8, x: 2, y: 2)
    }
    
    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.gray.opacity(0.1))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
    }
    
    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                headSilhouette
            }
            
            Text(card.time)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text(card.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            WaveformView(color: card.type.waveformColor)
                .frame(height: 30)
                .padding(.horizontal, 20)
        }
        .frame(width: 280, height: 360)
        .background(cardBackground)
    }
}

struct WaveformView: View {
    let color: Color
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<20, id: \.self) { index in
                RoundedRectangle(cornerRadius: 1)
                    .fill(color)
                    .frame(width: 3, height: CGFloat.random(in: 4...25))
                    .animation(.easeInOut(duration: 0.5).repeatForever(), value: true)
            }
        }
    }
}

struct SubscriptionPlanView: View {
    let title: String
    let subtitle: String
    let badge: String
    let isSelected: Bool
    let isRecommended: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    if !subtitle.isEmpty {
                        Text(subtitle)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                if !badge.isEmpty {
                    Text(badge)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.blue)
                        )
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                isRecommended ? Color.blue : (isSelected ? Color.white.opacity(0.5) : Color.gray.opacity(0.3)),
                                lineWidth: isRecommended ? 2 : 1
                            )
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isSelected ? 1.02 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
    }
}

#Preview {
    NavigationView {
        ConversionPage17()
    }
}




