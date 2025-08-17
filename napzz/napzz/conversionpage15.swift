//
import SwiftUI

struct ConversionPage15: View {
    @State private var animateCards = false
    @State private var selectedSound: Int? = nil
    @State private var navigateToNext = false
    @State private var animateContent = false
    @Environment(\.presentationMode) var presentationMode
    
    let soundCategories = ["All", "New", "Rain", "ASMR", "Nature", "AI"]
    @State private var selectedCategory = "All"
    
    let sounds = [
        SoundItem(name: "Rain", icon: "cloud.rain", color: .blue),
        SoundItem(name: "Exhaust Fan", icon: "fan.fill", color: .gray),
        SoundItem(name: "Campfire", icon: "flame", color: .orange),
        SoundItem(name: "Ocean Waves", icon: "wave.3.right", color: .cyan),
        SoundItem(name: "Rain on Leaves", icon: "leaf", color: .green),
        SoundItem(name: "Rain on Tent", icon: "triangle", color: .gray),
        SoundItem(name: "Rain on Roof", icon: "house", color: .brown),
        SoundItem(name: "Wind", icon: "wind", color: .gray),
        SoundItem(name: "White Noise", icon: "waveform", color: .white),
        SoundItem(name: "Blue Noise", icon: "waveform.path", color: .blue),
        SoundItem(name: "Seagull", icon: "bird", color: .gray),
        SoundItem(name: "Green Noise", icon: "waveform.path.ecg", color: .green),
        SoundItem(name: "Brown Noise", icon: "waveform.circle", color: .brown),
        SoundItem(name: "Pink Noise", icon: "waveform.path.badge.plus", color: .pink),
        SoundItem(name: "Violet Rain", icon: "cloud.drizzle", color: .purple),
        SoundItem(name: "Thunderstorm", icon: "cloud.bolt.rain", color: .yellow)
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
                    Text("Best Sound Machine")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.orange)
                        .opacity(animateCards ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.8).delay(0.2), value: animateCards)
                    
                    Text("Customized white noise helps you fall asleep faster")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .opacity(animateCards ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.8).delay(0.4), value: animateCards)
                }
                .padding(.bottom, 30)
                
                // Mock Phone Interface
                VStack(spacing: 20) {
                    // Phone mockup
                    ZStack {
                        // Phone frame
                        RoundedRectangle(cornerRadius: 35)
                            .fill(Color.black)
                            .frame(width: 320, height: 580)
                            .overlay(
                                RoundedRectangle(cornerRadius: 35)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                            )
                        
                        // Screen content
                        VStack(spacing: 0) {
                            // Status bar mockup
                            HStack {
                                Text("9:41")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                Spacer()
                                HStack(spacing: 2) {
                                    Image(systemName: "wifi")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                    Image(systemName: "battery.75")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 10)
                            .padding(.bottom, 20)
                            
                            // App interface
                            VStack(spacing: 15) {
                                // Category tabs
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                                        ForEach(soundCategories, id: \.self) { category in
                                            Button(action: {
                                                selectedCategory = category
                                            }) {
                                                Text(category)
                                                    .font(.system(size: 14, weight: .medium))
                                                    .foregroundColor(selectedCategory == category ? .white : .gray)
                                                    .padding(.horizontal, 16)
                                                    .padding(.vertical, 8)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .fill(selectedCategory == category ? Color.blue : Color.clear)
                                                    )
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 20)
                                }
                                
                                // Sound grid
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 4), spacing: 15) {
                                    ForEach(Array(sounds.prefix(12).enumerated()), id: \.offset) { index, sound in
                                        SoundButton(
                                            sound: sound,
                                            isSelected: selectedSound == index,
                                            onTap: {
                                                selectedSound = index
                                                let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                                                impactFeedback.impactOccurred()
                                            }
                                        )
                                    }
                                }
                                .padding(.horizontal, 20)
                                
                                Spacer()
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.black.opacity(0.9))
                            )
                            .padding(.horizontal, 8)
                            .padding(.bottom, 8)
                        }
                    }
                    .scaleEffect(animateCards ? 1.0 : 0.8)
                    .opacity(animateCards ? 1.0 : 0.0)
                    .animation(.spring(response: 0.8, dampingFraction: 0.8).delay(0.6), value: animateCards)
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
                .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(1.2), value: animateCards)
                .padding(.bottom, 50)
            }
            
            // Navigation link to reviews page
            NavigationLink(
                destination: ConversionPage16(),
                isActive: $navigateToNext,
                label: { EmptyView() }
            )
            .hidden()
        }
        
        .opacity(animateContent ? 1.0 : 0.0)
        .scaleEffect(animateContent ? 1.0 : 0.95)
        .animation(.easeOut(duration: 0.8), value: animateContent)
        
        ConversionProgressBar(currentStep: 15, initialProgress: 14.0 / 17.0)
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

struct SoundItem {
    let name: String
    let icon: String
    let color: Color
}

struct SoundButton: View {
    let sound: SoundItem
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 6) {
                // Icon circle
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 50, height: 50)
                    
                    if sound.name == "Campfire" {
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 50, height: 50)
                    }
                    
                    Image(systemName: sound.icon)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(sound.name == "Campfire" ? .white : sound.color)
                }
                
                // Sound name
                Text(sound.name)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(height: 26)
            }
            .scaleEffect(isSelected ? 1.1 : 1.0)
            .opacity(isSelected ? 0.8 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

