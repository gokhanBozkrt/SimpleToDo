//
//  ItemRowView.swift
//  SimpleToDo
//
//  Created by Gökhan Bozkurt on 21.04.2023.
//

import SwiftUI

struct ItemRowView: View {
    @Binding var item: ToDoItem
    var body: some View {
        NavigationLink {
            DetailView(item: $item)
        } label: {
            Label(item.title, systemImage: item.icon)
                .animation(nil, value: item)
        }
        .tag(item)
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: .constant(.example))
    }
}
