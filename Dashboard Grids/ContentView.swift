//
//  ContentView.swift
//  Dashboard Grids
//
//  Created by Neha on 28/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    var columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    var body: some View {
        VStack {
            HStack {
                Text("Stats")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color("Color"))
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal)
            
            HStack(spacing: 0) {
                Text("Day")
                    .fontWeight(.bold)
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .foregroundColor(index == 0 ? .white : Color("Color"))
                    .background(index == 0 ? Color("Color") : .clear)
                    .clipShape(Capsule())
                    .onTapGesture {
                        index = 0
                    }
                Spacer(minLength: 0)
                Text("Week")
                    .fontWeight(.bold)
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .foregroundColor(index == 1 ? .white : Color("Color"))
                    .background(index == 1 ? Color("Color") : .clear)
                    .clipShape(Capsule())
                    .onTapGesture {
                        index = 1
                    }
                Spacer(minLength: 0)
                Text("Month")
                    .fontWeight(.bold)
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .foregroundColor(index == 2 ? .white : Color("Color"))
                    .background(index == 2 ? Color("Color") : .clear)
                    .clipShape(Capsule())
                    .onTapGesture {
                        index = 2
                    }
            }
            .background(Color.black.opacity(0.06))
            .clipShape(Capsule())
            .padding(.top, 15)
            .padding(.horizontal)
            TabView(selection: self.$index) {
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(fitness_array_day) { data in
                            GridView(data: data)
                            
                        }
                    }
                    .padding()
                    Spacer(minLength: 0)
                }
                .tag(0)
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(fitness_array_week) { data in
                            GridView(data: data)
                            
                        }
                    }
                    .padding()
                    Spacer(minLength: 0)
                }
                .tag(1)
                
                VStack {
                    Text("No Data Found")
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                }
                .tag(2)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
        }
        .padding(.top)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Model data
struct Fitness: Identifiable {
    var id: Int
    var title: String
    var image: String
    var data: String
    var suggest: String
    var color: String
}

struct GridView: View {
    var data: Fitness
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(data.title)
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                Spacer(minLength: 0)
                ZStack {
                    Image(systemName: data.image)
                        .foregroundColor(Color.white)
                }
                .padding()
                .background(Color.white.opacity(0.1))
                .clipShape(Circle())

            }
            HStack {
                Text(data.data)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Spacer(minLength: 0)
            }
            HStack {
                Spacer(minLength: 0)
                Text(data.suggest)
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
               
            }
            .padding(.trailing,10)
        }
        .padding(.leading,10)
        .padding(.bottom,10)
        .background(Color.init(data.color))
        .cornerRadius(19)
    }
}

var fitness_array_day = [
    Fitness(id: 0, title: "Heart Rate", image: "bolt.heart", data: "124 bpm", suggest: "Healthy\n80-120", color: "cycle"),
    Fitness(id: 1, title: "Sleep", image: "moon.zzz", data: "6h 30m", suggest: "Deep Sleep\n6h-8h", color: "sleep"),
    Fitness(id: 2, title: "Energy Burn", image: "sparkles", data: "583kcal", suggest: "Daily Goal\n900kcal", color: "running"),
    Fitness(id: 3, title: "Steps", image: "figure.walk", data: "15,400", suggest: "Daily Goal\n20,000Steps", color: "water"),
    Fitness(id: 4, title: "Running", image: "figure.walk.circle", data: "5.6km", suggest: "Daily Goal\n10 km", color: "steps"),
    Fitness(id: 5, title: "Cycling", image: "bicycle.circle", data: "10km", suggest: "Daily Goad\n15km", color: "heart")
]


var fitness_array_week = [
    Fitness(id: 0, title: "Heart Rate", image: "bolt.heart", data: "84 bpm", suggest: "Healthy\n80-120", color: "cycle"),
    Fitness(id: 1, title: "Sleep", image: "moon.zzz", data: "42h 30m", suggest: "Deep Sleep\n25h-30h", color: "sleep"),
    Fitness(id: 2, title: "Energy Burn", image: "sparkles", data: "3,500kcal", suggest: "Daily Goal\n4000kcal", color: "running"),
    Fitness(id: 3, title: "Steps", image: "figure.walk", data: "20,400", suggest: "Daily Goal\n25,000Steps", color: "water"),
    Fitness(id: 4, title: "Running", image: "figure.walk.circle", data: "7.6km", suggest: "Daily Goal\n20km", color: "steps"),
    Fitness(id: 5, title: "Cycling", image: "bicycle.circle", data: "220km", suggest: "Daily Goad\n25km", color: "heart")
]
