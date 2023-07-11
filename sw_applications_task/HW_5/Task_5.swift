import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Next Screen") {
                    isPresented = true
                }
                .padding()
                .sheet(isPresented: $isPresented) {
                    SecondScreen()
                }
            }
            .navigationBarTitle("First Screen")
        }
    }
}

struct SecondScreen: View {
    var body: some View {
        VStack {
            Text("Second Screen")
                .font(.title)
                .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
