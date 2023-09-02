//
//  NoItemsView.swift
//  To-Do-List-App
//
//  Created by Emir TAŞÇAKIR on 2.09.2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Text("No Items Yet...")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your to do list!")
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something 🥳")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(height: 65)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                            .padding()
                    })
                .padding(.horizontal, animate ? 10 : 20)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.6) : Color.accentColor.opacity(0.6),
                        radius: animate ? 30 : 10,
                        x: 0.0,
                        y: animate ? 20 : 12)
                .scaleEffect(animate ? 1.05 : 1.0)
                .offset(y: animate ? -5 : 0)
            }
            .frame(maxWidth: 400 )
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
