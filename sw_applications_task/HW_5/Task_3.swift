import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создание WKWebView и добавление в качестве subview
        webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        // Загрузка страницы ВКонтакте
        if let url = URL(string: "https://dev.vk.com/api/oauth-parameters") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        // Реализация логики для обработки навигации в WKWebView
        decisionHandler(.allow)
    }

}
