//
//  IMCResult.swift
//  FirstSwitchApp
//
//  Created by Rafael Romo Muñoz on 02/12/24.
//

import SwiftUI

struct IMCResult: View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        VStack{
            Text("Your Result:")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            InformationView(
                result: calculateIMC(weight: userWeight, height: userHeight)
            )
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
    }
}

func calculateIMC(weight:Double, height:Double) -> Double{
    let result = weight / (pow(height/100, 2))
    return(result)
}

struct InformationView:View {
    let result:Double
    var body: some View{
        let info = getIMCResult(result: result)
        VStack{
            Spacer()
            Text(info.0).foregroundColor(info.2)
                .font(.title)
                .bold()
            Text("\(result, specifier: "%.2f")")
                .font(.system(size: 80))
                .bold()
                .foregroundColor(.white)
            Spacer()
            Text(info.1).foregroundColor(.white).font(.title2).padding(.horizontal, 10)
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
            .cornerRadius(16)
            .padding(16)
    }
}

func getIMCResult(result:Double) -> (String, String, Color){
    let title:String
    let description:String
    let color:Color
    
    switch result{
    case 0.0..<20.0:
        title = "Underweight"
        description = "You're under the recommended weight according IMC"
        color = Color.yellow
    case 20.0..<25.0:
        title = "Normal"
        description = "You good nigga"
        color = Color.green
    case 25.0..<30.0:
        title = "Overweight"
        description = "U fat"
        color = Color.orange
    case 30.0..<100:
        title = "Whale"
        description = "Stop eating nigga"
        color = Color.red
    default:
        title = "ERROR"
        description = "There is something wrong"
        color = Color.gray
    }
    return (title, description, color)
}

#Preview {
    IMCResult(userWeight: 80, userHeight: 190)
}
