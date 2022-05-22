//
//  AddView.swift
//  TodoList
//
//  Created by Benjamin Ngarambe on 22/05/2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView{
            ScrollView{
                VStack {
                    TextField("Type something new here...", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(red: 255, green: 64, blue: 0))
                        .cornerRadius(10)
                    Button(action: saveButtonPressed, label: {
                        Text("save".uppercased())
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(10)
                            .font(.headline)
                            .background(Color.accentColor)
                    })
                }
                .padding(15)
            }
        }
        .navigationTitle("Add an item ✍️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.AddItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 5 {
            alertTitle = "Your new Todo Item must be at least 5 characters long 😥"
            showAlert.toggle()
            return false
        }
        return true
    }
    //using the above function I can also create a function to check if user uses curse words and send an alert for them.
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
        .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
        .previewDevice("iPhone 11")
    }
}
