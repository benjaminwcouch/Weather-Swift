//
//  ContentView.swift
//  Weather
//
//  Created by Benjamin Couch on 19/7/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ColorChange(BackGround: .red, ForeGround: .blue)

            CityTextView(CityName: "Cupertin, CA")
        }
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
                .padding(2)

            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)

            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ContentView()
}

struct ColorChange : View {
    var BackGround: Color
    var ForeGround: Color
    
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [BackGround, ForeGround]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var CityName: String
    
    var body: some View {
        VStack {
            Text(CityName)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            
            VStack {
                Image(systemName: "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
                Text("76°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
                
                HStack {
                    WeatherDayView(dayOfWeek: "Mon", imageName: "cloud.heavyrain.fill", temperature: 44)
                    WeatherDayView(dayOfWeek: "Tues", imageName: "sun.max.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "Wed", imageName: "cloud.heavyrain.fill", temperature: 62)
                    WeatherDayView(dayOfWeek: "Thu", imageName: "cloud.drizzle.circle.fill", temperature: 62)
                    WeatherDayView(dayOfWeek: "Fri", imageName: "cloud.heavyrain.fill", temperature: 45)
                    WeatherDayView(dayOfWeek: "Sat", imageName: "cloud.heavyrain.fill", temperature: 45)
                }
                Spacer()
                
                Button {print("TAPPED")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(20.0)
                        .foregroundColor(.yellow)
                        .onSubmit() {
                        }
                }
                
                Spacer()
                
            }
            
        }
    }
}
