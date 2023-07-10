import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Новый проект для GB")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

Создан новый проект с использованием SwiftUI. В структуре ContentView определен основной интерфейс 
с помощью Text, который выводит строку "Новый проект для GB". Также к этому тексту применяется отступ 
с помощью .padding().
Структура ContentView_Previews используется для предварительного просмотра интерфейса в режиме разработки. 
Внутри нее создается экземпляр ContentView(), который будет отображаться в режиме предварительного просмотра.