//
//  RoutineView.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//

import SwiftUI

struct RoutineView: View {
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 60/255, green: 40/255, blue: 160/255),
                    Color(red: 30/255, green: 20/255, blue: 80/255)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HeaderSection()
                DateSelectorSection()
                RoutineCardSection()
                Spacer()
                CustomTabBar()
            }
        }
    }
}

struct HeaderSection: View {
    var body: some View {
        HStack {
            Text("20.04")
                .foregroundColor(.white.opacity(0.7))
                .font(.subheadline)
            Spacer()
            Text("Routine Jul 3")
                .foregroundColor(.white)
                .font(.headline)
            Spacer()
            Button("Edit") { /* action */ }
                .foregroundColor(.white.opacity(0.7))
                .font(.subheadline)
        }
        .padding(.horizontal)
        .padding(.top, 50)
    }
}

struct DateSelectorSection: View {
    var body: some View {
        HStack(spacing: 24) {
            ForEach(29...30, id: \.self) { day in
                Text("\(day)")
                    .foregroundColor(.white.opacity(0.4))
            }
            ForEach(1...5, id: \.self) { day in
                if day == 3 {
                    ZStack {
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                            .frame(width: 32, height: 32)
                        Text("\(day)")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                } else {
                    Text("\(day)")
                        .foregroundColor(.white.opacity(0.4))
                }
            }
        }
        .padding(.vertical, 16)
    }
}


struct RoutineCardSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            // Bedtime and Wake up
            BedtimeWakeupSection()
            
            Text("Tap any card below to start your routine")
                .foregroundColor(.white.opacity(0.6))
                .font(.subheadline)
                .padding(.bottom, 8)
            
            // Wind Down Section
            RoutineCategorySection(
                title: "WIND DOWN",
                card: MeditationCardView(
                    title: "Dropping into the Present Moment",
                    subtitle: "Meditation • 14 min",
                    imageName: "wind.down"
                )
            )
            
            // Sleep Section
            RoutineCategorySection(
                title: "SLEEP",
                card: SleepTrackCardView()
            )
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

struct BedtimeWakeupSection: View {
    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Label("Bedtime", systemImage: "bed.double.fill")
                    .foregroundColor(.purple)
                    .font(.caption)
                HStack {
                    Text("11:00pm")
                        .font(.title2)
                        .foregroundColor(.white)
                    Text("|")
                        .foregroundColor(.white.opacity(0.5))
                    Text("7:00am")
                        .font(.title2)
                        .foregroundColor(.yellow)
                }
                Text("Tap to enable")
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.5))
            }
            Spacer()
        }
    }
}

struct RoutineCategorySection<Content: View>: View {
    let title: String
    let card: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
                Spacer()
                Button(action: {}) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.title2)
                }
            }
            card
        }
    }
}

struct MeditationCardView: View {
    let title: String
    let subtitle: String
    let imageName: String // Replace with your own asset name
    
    var body: some View {
        HStack {
            // Placeholder for image
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.green)
                .frame(width: 48, height: 48)
                .overlay(
                    Image(systemName: "leaf.fill")
                        .foregroundColor(.white)
                        .font(.title2)
                )
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.green.opacity(0.8), Color.blue.opacity(0.6)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16)
    }
}

struct SleepTrackCardView: View {
    @State private var isTracking = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Track your sleep")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Start routine to record")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
            }
            Spacer()
            Toggle("", isOn: $isTracking)
                .toggleStyle(SwitchToggleStyle(tint: Color.purple))
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.8), Color.blue.opacity(0.6)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16)
    }
}

struct CustomTabBar: View {
    var body: some View {
        HStack {
            TabBarItem(icon: "circle.grid.3x3.fill", label: "Home")
            Spacer()
            TabBarItem(icon: "music.note", label: "Sounds")
            Spacer()
            TabBarItem(icon: "moon.zzz.fill", label: "Routine", isSelected: true)
            Spacer()
            TabBarItem(icon: "chart.bar.fill", label: "Insights")
            Spacer()
            TabBarItem(icon: "heart.fill", label: "My Library")
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
        .background(Color.black.opacity(0.2))
    }
}

struct TabBarItem: View {
    let icon: String
    let label: String
    var isSelected: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(isSelected ? Color.purple : Color.white.opacity(0.7))
            Text(label)
                .font(.caption)
                .foregroundColor(isSelected ? Color.purple : Color.white.opacity(0.7))
        }
    }
}


struct Routineview: View {
    var body: some View {
        RoutineView()
    }
}

