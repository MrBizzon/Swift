import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=YOUR_APP_ID&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&scope=friends&response_type=token&v=API_VERSION")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        if let url = navigationResponse.response.url,
             url.absoluteString.range(of: "access_token=") != nil {
            
            // Получение access_token
            
            let range = url.absoluteString.range(of: "access_token=")
            let tokenIndex = range!.upperBound
            let accessToken = String(url.absoluteString.suffix(from: tokenIndex))
            
            // Получение ID пользователя
            
            let rangeID = url.absoluteString.range(of: "&user_id=")
            let userIDIndex = rangeID!.upperBound
            let userID = String(url.absoluteString.suffix(from: userIDIndex))
            
            // Выполнение запроса к API VK
            
            let parameters = "user_id=\(userID)&order=name&fields=photo_100&access_token=\(accessToken)&v=API_VERSION"
            let urlRequest = URL(string: "https://api.vk.com/method/friends.get?\(parameters)")
            
            URLSession.shared.dataTask(with: urlRequest!) { (data, response, error) in
                if let error = error {
                    print("Ошибка: \(error.localizedDescription)")
                    // Отобразить сообщение об ошибке пользователю
                }
                
                guard let data = data else {
                    print("Получены некорректные данные")
                    // Отобразить сообщение об ошибке пользователю
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                    guard let response = json?["response"] as? [String: Any],
                        let items = response["items"] as? [[String: Any]] else {
                            print("Получены некорректные данные")
                            // Отобразить сообщение об ошибке пользователю
                            return
                    }
                    
                    // Обработка полученных данных и отображение списка друзей
                    
                } catch {
                    print("Ошибка при разборе JSON")
                    // Отобразить сообщение об ошибке пользователю
                }
                
            }.resume()
            
            decisionHandler(.cancel)
            
        } else {
            decisionHandler(.allow)
        }
    }
    
}