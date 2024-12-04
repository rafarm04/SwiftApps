//
//  IMCView.swift
//  FirstSwitchApp
//
//  Created by Rafael Romo Muñoz on 01/12/24.
//

import SwiftUI

struct IMCView: View {
    //Change the color of the navigationBarTitle
    //    init () {
    //        UINavigationBar
    //            .appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    //    }
    
    //Add states for component use
    @State var gender:Int = 0
    @State var height:Double = 110
    @State var age:Double = 0
    @State var weight:Double = 0
    
    var body: some View {
        VStack{
            //Call ToggleButton component
            HStack{
                ToggleButton(text: "Man", imageName: "person.crop.circle.fill", gender: 0, selectedGender: $gender)
                ToggleButton(
                    text: "Woman",
                    imageName: "person.crop.circle.dashed.circle",
                    gender: 1,
                    selectedGender: $gender
                )
            }
            
            /*-----------------------------------*/
            //Call HeightCalculator component
            HeightCalculator(selectedHeight: $height)
            
            /*-----------------------------------*/
            //Call WeightCalculator Component
            HStack{
                WeightCalculator(text: "Age", selectedValue: $age)
                WeightCalculator(text: "Weight", selectedValue: $weight)
            }
            /*-----------------------------------*/
            //Call IMCResult component
            IMC(userWeight: weight, userHeight: height)
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
            .navigationBarBackButtonHidden() //Hides the return (< Back) button
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("IMC Calculator").foregroundColor(.white)
                }
            }
        
        
        //            .navigationTitle("IMC Calculator") //By default the text is black
    }
}

//Create new components
struct ToggleButton : View {
    //Parameters
    let text:String
    let imageName:String
    let gender:Int
    @Binding var selectedGender:Int
    
    var body: some View {
        //Functionality of leaving the button pressed
        let color = if(gender == selectedGender){
            Color.backgroundComponentSelected
        }else{
            Color.backgroundComponent
        }
        
        Button(action: {
            selectedGender = gender
        }){
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                InformationText(text: text)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(color)
        }
    }
}

struct InformationText : View {
    let text:String
    var body: some View {
        Text(text).bold()
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}

struct TitleText: View {
    let text:String
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct HeightCalculator:View {
    @Binding var selectedHeight:Double
    
    var body: some View {
        VStack{
            TitleText(text: "Height")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in: 0...220, step: 1)
                .accentColor(.purple)
                .padding(.horizontal, 16)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
    }
}

struct ButtonImplementation: View {
    @Binding var selectedValue:Double
    
    var body: some View {
        Button(
            action: {
                if(selectedValue <= 0){
                selectedValue = 0
                }else{
                    selectedValue -= 1
                }
            }){
                Image(systemName: "minus.circle.fill")
                    .resizable()
                    .foregroundColor(.purple)
                    .scaledToFit()
                    .padding(.horizontal, 10)
            }
        Button(action: {selectedValue += 1}){
            Image(systemName: "plus.circle.fill")
                .resizable()
                .foregroundColor(.purple)
                .scaledToFit()
                .padding(.horizontal, 10)
        }
    }
}

struct WeightCalculator:View{
    let text:String
    @Binding var selectedValue:Double
    
    var body: some View{
        VStack{
            TitleText(text: text)
            InformationText(text: "\(Int(selectedValue))")
            //Buttons for adding or substracting
            HStack{
                ButtonImplementation(selectedValue: $selectedValue)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
    }
}

struct IMC:View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        NavigationStack{
            NavigationLink(destination: IMCResult(userWeight: userWeight, userHeight: userHeight)){
                Text("Calculate")
                    .font(.title)
                    .bold()
                    .foregroundColor(.purple)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.backgroundComponent)

            }
        }
    }
}

#Preview {
    IMCView()
}
