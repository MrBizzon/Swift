import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=YOUR_APP_CLIENT_ID&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&scope=friends,photos,wall&response_type=token&v=5.122")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        if let url = navigationResponse.response.url {
            let urlString = url.absoluteString
            if urlString.contains("#access_token=") && urlString.contains("&expires_in=") {
                let accessToken = urlString.components(separatedBy: "#access_token=")[1].components(separatedBy: "&expires_in=")[0]
                let userId = urlString.components(separatedBy: "user_id=")[1]
                
                print("Access Token: \(accessToken)")
                print("User ID: \(userId)")
                
                // Дальнейшие действия с полученным токеном и идентификатором пользователя
                
                decisionHandler(.cancel)
                return
            }
        }
        decisionHandler(.allow)
    }
}

// В коде нужно заменить YOUR_APP_CLIENT_ID на идентификатор приложения VK.