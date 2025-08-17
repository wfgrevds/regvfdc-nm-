//
//  conversionpage8.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//





import SwiftUI

struct conversionpage8: View {
    @State private var selectedPosition: SleepPosition? = nil
    @State private var animateOptions = false
    @State private var navigateToNext = false
    @State private var animateContent = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                // Dark background
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header with back button and robot
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
                    .padding(.top, 20)
                    
                    // Title
                    Text("What's your sleep position?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    // Sleep position options
                    VStack(spacing: 16) {
                        ForEach(SleepPosition.allCases, id: \.self) { position in
                            SleepPositionCard(
                                position: position,
                                isSelected: selectedPosition == position,
                                animate: animateOptions
                            ) {
                                selectedPosition = position
                                // Navigate to next page after a short delay
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToNext = true
                                }
                            }
                            .scaleEffect(animateOptions ? 1.0 : 0.8)
                            .opacity(animateOptions ? 1.0 : 0.0)
                            .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(Double(position.rawValue) * 0.1), value: animateOptions)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    Spacer()
                    
                }
                .opacity(animateContent ? 1.0 : 0.0)
                .scaleEffect(animateContent ? 1.0 : 0.95)
                .animation(.easeOut(duration: 0.8), value: animateContent)
                
                ConversionProgressBar(currentStep: 8, initialProgress: 7.0 / 17.0)
                
                // Navigation link (invisible)
                NavigationLink(
                    destination: conversionpage9(),
                    isActive: $navigateToNext,
                    label: { EmptyView() }
                )
                .hidden()
            }
            .navigationBarHidden(true)
            .onAppear {
                withAnimation {
                    animateContent = true
                    animateOptions = true
                }
            }
            .onDisappear {
                animateContent = false
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SleepPositionCard: View {
    let position: SleepPosition
    let isSelected: Bool
    let animate: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {
                // Position image placeholder
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 80, height: 60)
                    
                    // Position icon based on type
                    Image(systemName: position.iconName)
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                // Position name
                Text(position.displayName)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(isSelected ? 0.4 : 0.2))
                    .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isSelected ? 1.02 : 1.0)
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}

enum SleepPosition: Int, CaseIterable {
    case back = 0
    case side = 1
    case fetal = 2
    case stomach = 3
    
    var displayName: String {
        switch self {
        case .back: return "Back"
        case .side: return "Side"
        case .fetal: return "Fetal"
        case .stomach: return "Stomach"
        }
    }
    
    var iconName: String {
        switch self {
        case .back: return "person.fill"
        case .side: return "person.crop.circle"
        case .fetal: return "person.crop.circle.fill"
        case .stomach: return "person.fill"
        }
    }
}

#Preview {
    conversionpage8()
}
