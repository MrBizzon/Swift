import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=YOUR_CLIENT_ID&redirect_uri=YOUR_REDIRECT_URI&scope=YOUR_SCOPE&response_type=token&v=5.95")!
        let request = URLRequest(url: url)
        webView.load(request)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        if let url = navigationResponse.response.url, url.absoluteString.contains("access_token=") {
            let token = extractToken(from: url)
            let userId = extractUserId(from: url)
            
            // Далее, использую полученный токен и ID пользователя для дальнейших запросов
            // ...
            
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
    
    private func extractToken(from url: URL) -> String? {
        return nil
    }
    
    private func extractUserId(from url: URL) -> String? {
        return nil
    }
}