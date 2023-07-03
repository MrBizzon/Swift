// Выполнил задачу по двум вариантам. 
// Вот первый вариант. Приведенный код добавляет WKWebView на ViewController и начинает загрузку 
// страницы "https://dev.vk.com/" при запуске приложения. Метод webView(_:decidePolicyFor:decisionHandler:) 
// реализован для обработки навигационных ответов. В данном примере он просто разрешает загрузку, 
// но можно добавить свою логику обработки.

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        if let url = URL(string: "https://dev.vk.com/") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
}


// Это второй вариант решения задачи.

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Создание WKWebView
        webView = WKWebView(frame: view.frame)
        webView.navigationDelegate = self
        view.addSubview(webView)

        // Загрузка URLRequest
        if let url = URL(string: "https://dev.vk.com/api/oauth-parameters") {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        // Реализация метода decidePolicyFor
        decisionHandler(.allow)
    }
}