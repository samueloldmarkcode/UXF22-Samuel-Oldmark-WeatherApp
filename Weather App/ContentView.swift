import SwiftUI

struct ContentView: View {
    init() {
        // Set the appearance of the navigation bar title text color
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white // Set the color to white
        ]
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 12) {
                    Spacer().frame(height: 24) // Spacer to create space below the navigation title

                    LocationWeather(city: "Stockholm", temperature: "22", condition: "Partly cloudy")
                        .padding(.horizontal, 16)

                    LocationWeather(city: "Miami", temperature: "32", condition: "Sunny")
                        .padding(.horizontal, 16)

                    LocationWeather(city: "Singapore", temperature: "26", condition: "Cloudy")
                        .padding(.horizontal, 16)
                }
                .edgesIgnoringSafeArea(.all) // Expand content to fill the screen
                .navigationTitle("Locations")
            }
            .background(Color(red: 0.12, green: 0.16, blue: 0.18)) // Background color
            .foregroundColor(.white) // Set the navigation title color to white
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Use StackNavigationViewStyle to support iPadOS
    }
}

struct LocationWeather: View {
    let city: String
    let temperature: String
    let condition: String

    var body: some View {
        NavigationLink(destination: WeatherDetailView(city: city, temperature: temperature, condition: condition)) {
            HStack(spacing: 32) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(city)
                        .scaledFont(name: "Barlow Condensed", size: 40, weight: .medium)
                        .foregroundColor(.black)
                        .padding(.leading, 16)

                    Text(condition)
                        .scaledFont(name: "Barlow Condensed", size: 22, weight: .medium)
                        .foregroundColor(.black)
                        .padding(.leading, 16)
                }

                Spacer()

                ZStack {
                    if condition == "Partly cloudy" {
                        // Cloud images for partly cloudy or sunny
                        
                        Ellipse()
                            .fill(Color(red: 1, green: 0.89, blue: 0))
                            .frame(width: 16, height: 16) // Fixed size of the ellipse
                            .offset(x: 18, y: -22) // Fixed position of the ellipse
                        
                        Image("CloudLight")
                            .resizable()
                            .frame(width: 16, height: 12) // Match the size of the ellipse
                            .offset(x: 11, y: -26) // Match the position of the ellipse

                    } else if condition == "Cloudy" {
                        // Cloud images only for cloudy
                        Image("CloudLight")
                            .resizable()
                            .frame(width: 16, height: 12) // Match the size of the ellipse
                            .offset(x: 18, y: -22) // Match the position of the ellipse

                    } else if condition == "Sunny" {
                        // Cloud images for partly cloudy or sunny
                        Ellipse()
                            .fill(Color(red: 1, green: 0.89, blue: 0))
                            .frame(width: 16, height: 16) // Fixed size of the ellipse
                            .offset(x: 18, y: -22) // Fixed position of the ellipse

                    }
                    
                    Text(temperature)
                        .scaledFont(name: "Barlow Condensed", size: 48, weight: .black)
                        .foregroundColor(.black)
                        .padding(.trailing, 8)
                }
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(24)
            .shadow(color: Color(red: 0.10, green: 0.11, blue: 0.12, opacity: 0.25), radius: 16, y: 4)
            .accessibilityElement(children: .combine) // Combine child elements into a single accessibility element
            .accessibility(label: Text("The weather in \(city) is \(condition) and \(temperature) degrees Celsius. Double tap for more information.")) // Set the accessibility label for the entire content
        }
        .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to remove default button styling
    }
}

struct WeatherDetailView: View {
    let city: String
    let temperature: String
    let condition: String

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 24) {
                Text(city)
                    .scaledFont(name: "Barlow Condensed", size: 40, weight: .medium)
                    .foregroundColor(.white)

                ZStack(alignment: .top) {
                    
                    if condition == "Partly cloudy" {
                        // Cloud images for partly cloudy or sunny
                        Image("CloudLight")
                            .resizable()
                            .frame(width: 130, height: 70)
                            .offset(x: 90, y: 40)

                        Image("CloudLight")
                            .resizable()
                            .frame(width: 150, height: 85)
                            .offset(x: -110, y: 120)

                        Image("CloudDark")
                            .resizable()
                            .frame(width: 140, height: 75)
                            .offset(x: 110, y: 230)
                        
                        Text("°")
                            .scaledFont(name: "Barlow Condensed", size: 120, weight: .medium)
                            .foregroundColor(.white)
                            .offset(x: 140, y: 50)
                        
                    } else if condition == "Cloudy" {
                        // Cloud images only for cloudy
                        Image("CloudLight")
                            .resizable()
                            .frame(width: 130, height: 70)
                            .offset(x: 90, y: 40)

                        Image("CloudLight")
                            .resizable()
                            .frame(width: 150, height: 85)
                            .offset(x: -110, y: 120)
                        
                        Image("CloudDark")
                            .resizable()
                            .frame(width: 140, height: 75)
                            .offset(x: 110, y: 230)
                        
                        Text("°")
                            .scaledFont(name: "Barlow Condensed", size: 120, weight: .medium)
                            .foregroundColor(.white)
                            .offset(x: 140, y: 50)
                    }

                    if condition != "Cloudy" {
                        // Ellipse for partly cloudy or sunny
                        Ellipse()
                            .fill(Color(red: 1, green: 0.89, blue: 0))
                            .frame(width: 80, height: 80)
                            .shadow(color: Color(red: 1, green: 0.89, blue: 0, opacity: 0.80), radius: 30, x: 2, y: 4)
                            .offset(x: -100, y: 40)
                        
                        Text("°")
                            .scaledFont(name: "Barlow Condensed", size: 120, weight: .medium)
                            .foregroundColor(.white)
                            .offset(x: 140, y: 50)
                    }

                    Text(temperature)
                        .scaledFont(name: "Barlow Condensed", size: 264, weight: .black)
                        .foregroundColor(.white)
                }

                Text(condition)
                    .scaledFont(name: "Barlow Condensed", size: 24, weight: .medium)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.61, green: 0.80, blue: 0.84), Color(red: 0.61, green: 0.80, blue: 0.83)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: geometry.size.width + 10, height: geometry.size.height + 10) // Extend the frame by 10 points on all sides
                    .offset(x: -2, y: -2) // Offset the gradient to cover the entire screen with a slight border
            )
            .cornerRadius(0)
            .shadow(color: Color(red: 0.10, green: 0.11, blue: 0.12, opacity: 0.25), radius: 16, y: 4)
            .accessibilityElement(children: .combine) // Combine child elements into a single accessibility element
            .accessibility(label: Text("The weather in \(city) is \(condition) and \(temperature) degrees Celsius")) // Set the accessibility label for the entire content
        }
        .edgesIgnoringSafeArea(.all) // Ignore safe area to cover the entire screen
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

