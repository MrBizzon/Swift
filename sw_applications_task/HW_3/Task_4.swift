import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: view.frame)
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=YOUR_APP_ID&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&scope=friends&response_type=token&v=5.130")!
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        if let url = webView.url?.absoluteString {
            if url.contains("access_token") && url.contains("user_id") {
                let components = url.components(separatedBy: "#")
                let params = components[1].components(separatedBy: "&")
                
                var token = ""
                var userID = ""
                
                for param in params {
                    let keyValue = param.components(separatedBy: "=")
                    let key = keyValue[0]
                    let value = keyValue[1]
                    
                    if key == "access_token" {
                        token = value
                    } else if key == "user_id" {
                        userID = value
                    }
                }
                
                print("Token: \(token)")
                print("UserID: \(userID)")
            }
        }
        
        decisionHandler(.allow)
    }
}