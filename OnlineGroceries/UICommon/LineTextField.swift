//
//  LineTextField.swift
//  OnlineGroceries
//
//  Created by Ben Sekyondwa on 24/06/2024.
//

import SwiftUI

struct LineTextField: View {
    
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    @Binding var text: String
    @State var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        
            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .disableAutocorrection(true)

            Divider()
        }
    }
}

struct LineSecureField: View {
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    @Binding var text: String
    @Binding var isShowPassword: Bool
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if(isShowPassword) {
                TextField(placeholder, text: $text)
                    .disableAutocorrection(true)
                    .modifier(ShowButton(isShow: $isShowPassword))
                   
            } else {
                SecureField(placeholder, text: $text)
                    .modifier(ShowButton(isShow: $isShowPassword))
            }
            Divider()
        }
    }
}


struct LineTextField_Previews: PreviewProvider {
    @State static var text: String = ""
    static var previews: some View {
        LineTextField(text: $text)
            .padding(20)
    }
}
