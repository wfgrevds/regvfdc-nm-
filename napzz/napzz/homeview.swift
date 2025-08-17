//
//  homeview.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.45, green: 0.35, blue: 0.85), // purple
                    Color(red: 0.25, green: 0.20, blue: 0.40)  // deep blue
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            HomeContent()
        }
    }
}

struct HomeContent: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HomeHeader()
            HomeCardsSection()
            HomeCategoriesSection()
            Spacer()
            HomeTabBar()
        }
        .padding(.top, 40)
    }
}

struct HomeHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .font(.title)
                .foregroundColor(.white.opacity(0.8))
            Spacer()
            Text("Good afternoon")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Button(action: {}) {
                HStack {
                    Image(systemName: "waveform")
                    Text("Recorder")
                        .font(.subheadline)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.white.opacity(0.15))
                .cornerRadius(16)
                .overlay(
                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                        .offset(x: 18, y: -10)
                )
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}

struct HomeCardsSection: View {
    let cards = [
        HomeCardData(title: "Fall Asleep Fast", subtitle: "Playlist • 6 h 19 min", image: "moon.stars.fill"),
        HomeCardData(title: "Vanquish 3 a.m. Insomnia", subtitle: "Meditation • 57 min", image: "circle.grid.cross"),
        HomeCardData(title: "Lucid Dream Brainwave", subtitle: "Mix", image: "waveform.path.ecg")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("To get you started")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(cards) { card in
                        HomeCardView(card: card)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 16)
        }
    }
}

struct HomeCardData: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: String
}

struct HomeCardView: View {
    let card: HomeCardData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.purple.opacity(0.7), Color.blue.opacity(0.6)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 160, height: 120)
                Image(systemName: card.image)
                    .font(.system(size: 40))
                    .foregroundColor(.white.opacity(0.8))
            }
            Text(card.title)
                .font(.headline)
                .foregroundColor(.white)
            Text(card.subtitle)
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))
        }
        .frame(width: 160)
    }
}


struct HomeCategoriesSection: View {
    let categories = [
        ("SleepTales", "book.closed.fill"),
        ("Meditations", "brain.head.profile"),
        ("Music", "guitars"),
        ("Mixes", "leaf.fill")
    ]
    
    var body: some View {
        HStack(spacing: 32) {
            ForEach(categories, id: \.0) { category in
                VStack(spacing: 8) {
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.12))
                            .frame(width: 48, height: 48)
                        Image(systemName: category.1)
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    Text(category.0)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.9))
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 16)
    }
}


struct HomeTabBar: View {
    let tabs = [
        ("Home", "house.fill"),
        ("Sounds", "music.note"),
        ("Sleep", "moon.zzz.fill"),
        ("Insights", "chart.bar.fill"),
        ("My Library", "heart.fill")
    ]
    let selectedTab = 2 // "Sleep" tab selected
    
    var body: some View {
        HStack {
            ForEach(0..<tabs.count, id: \.self) { i in
                Spacer()
                VStack(spacing: 4) {
                    Image(systemName: tabs[i].1)
                        .font(.title2)
                        .foregroundColor(i == selectedTab ? Color.purple : Color.white.opacity(0.7))
                    Text(tabs[i].0)
                        .font(.caption2)
                        .foregroundColor(i == selectedTab ? Color.purple : Color.white.opacity(0.7))
                }
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .background(Color.black.opacity(0.15))
        .cornerRadius(24)
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}
