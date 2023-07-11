import SwiftUI

// Модель данных для новостей
struct News: Identifiable {
    let id = UUID()
    let title: String
    let date: String
}

// Вьюмодель для списка новостей
class NewsListViewModel: ObservableObject {
    @Published var news: [News] = []
    
    init() {
        // Данные о новостях можно получить из сети или использовать фиктивные данные
        news = [
            News(title: "Новость 1", date: "01.07.2023"),
            News(title: "Новость 2", date: "02.07.2023"),
            News(title: "Новость 3", date: "03.07.2023"),
            News(title: "Новость 4", date: "04.07.2023")
        ]
    }
}

// Главный экран с текстом/кнопкой/ссылкой
struct HomeView: View {
    var body: some View {
        VStack {
            Text("Перейти к новостям")
                .font(.title)
                .padding()
                .onTapGesture {
                    // Переход на следующий экран
                    let newsListView = NewsListView()
                    let newsListViewModel = NewsListViewModel()
                    newsListView.viewModel = newsListViewModel
                    UIApplication.shared.windows.first?.rootViewController?.present(UIHostingController(rootView: newsListView), animated: true, completion: nil)
                }
        }
    }
}

// Экран со списком новостей
struct NewsListView: View {
    @StateObject var viewModel: NewsListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.news) { news in
                VStack(alignment: .leading) {
                    Text(news.title)
                        .font(.title2)
                    Text(news.date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .navigationBarTitle("Новости")
        }
    }
}

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
