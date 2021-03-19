
import WebKit

//public protocol EvaluateJavaScriptDelegate: NSObjectProtocol {
//    func evaluateJavaScriptResult(name: String, result: Any?, error: Error?)
//}

public protocol MessageHandlerDelegate: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage)
}

open class WebBridge: WKWebView, WKScriptMessageHandler {
    
    open var messageHandler: MessageHandlerDelegate? = nil
    
    //    public weak var evaluateJavaScriptDelegate: EvaluateJavaScriptDelegate? = nil
    private var _cookieHelper = CookieHelper()
    //    private var _userContentController = WebBridgeConfiguration()

    // MARK: - member var
    var cookieHelper: CookieHelper {
        get { return _cookieHelper }
    }
    
    // MARK: - IBInspectablesß
    @IBInspectable var javaScriptNamesInterfaces : String? {
        get {
            return nil
        }
        set (value) {
            value?.components(separatedBy: "\n").forEach({ name in
                if !name.isEmpty {
                    let trimName = name.trimmingCharacters(in: .whitespaces)
                    print(trimName)
                    self.configuration.userContentController.add(self, name: trimName)
                }
            })
        }
    }
    
    @IBInspectable var javaScriptEnable : Bool {
        get {
            if #available(iOS 14.0, *) {
                return self.configuration.defaultWebpagePreferences.allowsContentJavaScript
            } else {
                return self.configuration.preferences.javaScriptEnabled
            }
        }
        set (value) {
            if #available(iOS 14.0, *) {
                self.configuration.defaultWebpagePreferences.allowsContentJavaScript = value
            } else {
                self.configuration.preferences.javaScriptEnabled = value
            }
        }
    }
    
    /// default FALSE
    @IBInspectable var javaScriptCanOpenWindowsAutomatically : Bool {
        get {
            return self.configuration.preferences.javaScriptCanOpenWindowsAutomatically
        }
        set (value) {
            self.configuration.preferences.javaScriptCanOpenWindowsAutomatically = value
        }
    }
    
    /// default TRUE
    @IBInspectable var showsVerticalScrollIndicator : Bool {
        get {
            return self.scrollView.showsVerticalScrollIndicator
        }
        set (value) {
            self.scrollView.showsVerticalScrollIndicator = value
        }
    }
    
    /// default TRUE
    @IBInspectable var showsHorizontalScrollIndicator : Bool {
        get {
            return self.scrollView.showsHorizontalScrollIndicator
        }
        set (value) {
            self.scrollView.showsHorizontalScrollIndicator = value
        }
    }
    
    /// default TRUE
    @IBInspectable var bounceOnScroll : Bool {
        get {
            return self.scrollView.bounces
        }
        set (value) {
            self.scrollView.bounces = value
        }
    }
    
    /// default TRUE
    @IBInspectable var bounceOnZoom : Bool {
        get {
            return self.scrollView.bouncesZoom
        }
        set (value) {
            self.scrollView.bouncesZoom = value
        }
    }
    
    /// default FALSE
    @IBInspectable var bounceHorizontally : Bool {
        get {
            return self.scrollView.alwaysBounceHorizontal
        }
        set (value) {
            self.scrollView.alwaysBounceHorizontal = value
        }
    }
    
    /// default FALSE
    @IBInspectable var bounceVertically : Bool {
        get {
            return self.scrollView.alwaysBounceVertical
        }
        set (value) {
            self.scrollView.alwaysBounceVertical = value
        }
    }
    
    // MARK: - Outlet 함수
    /// url, urlrequest 귀찮아서 작성해 놓음..
    public func load(address: String) {
        if let url = URL(string: address) {
            self.load(URLRequest(url: url))
        }
    }
    
    public func canOpenUrl(address: String) {
        if let url = URL(string: address), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    // MARK: - Delegate
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        self.messageHandler?.userContentController(userContentController, didReceive: message)
    }
}
