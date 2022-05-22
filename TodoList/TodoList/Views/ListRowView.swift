//
//  ListRowView.swift
//  TodoList
//
//  Created by Benjamin Ngarambe on 22/05/2022.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ?"checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,9)
    }
}
struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "this is the first item on the list", isCompleted: false)
    static var item2 = ItemModel(title: "this is the second item on the list", isCompleted: true)
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
            .previewDevice("iPhone 11")
            .previewLayout(.sizeThatFits)
    }
}
