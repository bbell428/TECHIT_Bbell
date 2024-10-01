//
//  ContentView.swift
//  NavigationUI
//
//  Created by 박준영 on 9/11/24.
//

import SwiftUI

struct ContentView: View {
    var carStore : CarStore = CarStore(cars: carData)
    @State private var stackPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach (0..<carStore.cars.count, id: \.self) { i in
                    NavigationLink(value: i) {
                        ListCell(car: carStore.cars[i])
                    }
                }
                 .onDelete(perform: deleteItems)
                 .onMove(perform: moveItems)
            }
            .navigationDestination(for: Int.self) { i in
                CarDetail(selectedCar: carStore.cars[i])
            }
            .navigationDestination(for: String.self) { _ in
                AddNewCar(carStore: self.carStore, path: $stackPath)
            }
            .navigationTitle(Text("EV Cars"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Add")
                        .foregroundStyle(.blue)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
        print(destination)
    }
}

struct ListCell: View {
    var car: Car
    
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(car.name)
        }
    }
}

#Preview {
    ContentView()
}
