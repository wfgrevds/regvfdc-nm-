//
//  conversionpage9.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//



import SwiftUI

enum SleepHabit: Int, CaseIterable {
    case stayUpLate = 0
    case sleepWithWetHair = 1
    case heavyFoodBeforeSleep = 2
    case sleepWithLightOn = 3
    case noneOfThese = 4
    
    var displayName: String {
        switch self {
        case .stayUpLate: return "Stay up late"
        case .sleepWithWetHair: return "Sleep with wet hair"
        case .heavyFoodBeforeSleep: return "Heavy food before sleep"
        case .sleepWithLightOn: return "Sleep with the light on"
        case .noneOfThese: return "None of these"
        }
    }
    
    var iconName: String {
        switch self {
        case .stayUpLate: return "😴"
        case .sleepWithWetHair: return "💧"
        case .heavyFoodBeforeSleep: return "🍔"
        case .sleepWithLightOn: return "💡"
        case .noneOfThese: return "🚫"
        }
    }
}

struct conversionpage9: View {
    @State private var selectedHabit: SleepHabit? = nil
    @State private var animateOptions = false
    @State private var navigateToNext = false
    @State private var animateContent = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
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
                Text("Which habit do you have that may affect your sleep quality?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.top, 40)
                
                Spacer()
                
                // Sleep habit options
                VStack(spacing: 16) {
                    ForEach(SleepHabit.allCases, id: \.self) { habit in
                        SleepHabitCard(
                            habit: habit,
                            isSelected: selectedHabit == habit,
                            animate: animateOptions
                        ) {
                            selectedHabit = habit
                            // Navigate to next page after a short delay
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                navigateToNext = true
                            }
                        }
                        .scaleEffect(animateOptions ? 1.0 : 0.8)
                        .opacity(animateOptions ? 1.0 : 0.0)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(Double(habit.rawValue) * 0.1), value: animateOptions)
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Spacer()
                
            }
            .opacity(animateContent ? 1.0 : 0.0)
            .scaleEffect(animateContent ? 1.0 : 0.95)
            .animation(.easeOut(duration: 0.8), value: animateContent)
            
            ConversionProgressBar(currentStep: 9, initialProgress: 8.0 / 17.0)
            
            // Navigation link (invisible)
            NavigationLink(
                destination: ConversionPage10(),
                isActive: $navigateToNext,
                label: { EmptyView() }
            )
            .hidden()
        }
        .navigationBarHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    animateContent = true
                    animateOptions = true
                }
            }
        }
        .onDisappear {
            animateContent = false
        }
    }
}

struct SleepHabitCard: View {
    let habit: SleepHabit
    let isSelected: Bool
    let animate: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {
                // Habit emoji icon
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 60, height: 60)
                    
                    Text(habit.iconName)
                        .font(.title)
                }
                
                // Habit name
                Text(habit.displayName)
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

#Preview {
    NavigationView {
        conversionpage9()
    }
}
