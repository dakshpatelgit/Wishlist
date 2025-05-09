//
//  ContentView.swift
//  Wishlist3
//
//  Created by m1 on 19/04/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //MARK: - PROPERTIES
    
    //SwiftData
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    //Alert
    @State private var isSheetShowing: Bool = false
    
    //TextField
    @State private var title: String = ""
    

    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .strikethrough(wish.isCompleted, color: .gray)
                        .foregroundStyle(wish.isCompleted ? .gray : .primary)
                        // DELETE SWIPE
                        .swipeActions(edge: .trailing){
                            Button {
                                modelContext.delete(wish)
                            } label: {
                                Label("Delete", systemImage: "x.circle.fill")
                            }
                            .tint(.red)
                        }//: - Delete Swipe

                        //Completed Swipe
                        .swipeActions(edge: .leading){
                            Button {
                                wish.isCompleted.toggle()
                                try? modelContext.save()
                            } label: {
                                Label("Mark Done", systemImage: "checkmark.circle")
                            }
                            .tint(.green)

                        }
                }
            }//: - LIST
            .navigationTitle("Wishlist")
            
            //MARK: - TOOLBAR
            .toolbar {
                
                //Add Wish
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isSheetShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                //Wish Count
                if wishes.isEmpty != true {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(wishes.count) Wish\(wishes.count > 1 ? "es" : "")")
                    }
                }
            }//: - Toolbar
            .alert("New Wish", isPresented: $isSheetShowing) {
                TextField("Enter a Wish", text: $title)
                
                Button {
                    modelContext.insert(Wish(title: title, isCompleted: false))
                    title = ""
                } label: {
                    Text("Save")
                }
                .disabled(title.isEmpty)

            }
            
            //MARK: - OVELAY
            .overlay{
                if wishes.isEmpty {
                    ContentUnavailableView("No Wishes", systemImage: "heart.circle", description: Text("Add some Wishes"))
                }
            }
        }//: - NSTACK
    }
}

#Preview("Sample Data") {
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(Wish(title: "Buy Iphone", isCompleted: true))
    container.mainContext.insert(Wish(title: "Buy Iphone", isCompleted: .random()))
    container.mainContext.insert(Wish(title: "Buy Iphone", isCompleted: .random()))
    container.mainContext.insert(Wish(title: "Buy Iphone", isCompleted: true))
    container.mainContext.insert(Wish(title: "Buy Iphone", isCompleted: .random()))
    
    return ContentView()
        .modelContainer(container)
}


#Preview("Empty View") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
