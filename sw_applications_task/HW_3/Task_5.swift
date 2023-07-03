import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        if let url = URL(string: "https://dev.vk.com/api/oauth-parameters") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        let response = navigationResponse.response as? HTTPURLResponse
        if let url = response?.url, url.host == "example.com" {
            let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
            if let queryItems = urlComponents?.queryItems {
                for item in queryItems {
                    if item.name == "token" {
                        let token = item.value
                        // Дальнейшие действия с токеном
                    }
                    if item.name == "user_id" {
                        let userID = item.value
                        // Дальнейшие действия с user ID
                    }
                }
            }
        }
        decisionHandler(.allow)
    }
}

// В данном коде мы импортируем WebKit, создаем экземпляр WKWebView и добавляем его в качестве подвижного 
// представления на ViewController. Делаем ViewController делегатом для WKWebView, чтобы отслеживать навигацию. 
// В методе viewDidLoad() мы загружаем страницу с параметрами API ВКонтакте. В методе 
// webView(_:decidePolicyFor:decisionHandler:) мы обрабатываем ответ сервера и извлекаем токен и идентификатор 
// пользователя. Далее вы можете выполнять необходимые действия с полученными значениями.