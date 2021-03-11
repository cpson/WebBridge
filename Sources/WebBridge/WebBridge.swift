
import WebKit

public protocol EvaluateJavaScriptDelegate: NSObjectProtocol {
    func evaluateJavaScriptResult(name: String, result: Any?, error: Error?)
}

open class WebBridge: WKWebView {
    
    public weak var evaluateJavaScriptDelegate: EvaluateJavaScriptDelegate? = nil
    
    /// default TRUE
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
                self.configuration.preferences.javaScriptEnabled = value
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
    
    // MARK: - load 함수
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
    
    // MARK: - Cookie Manager
    /// 모든 쿠키 제거
    public func deleteAllCookies() {
        let cookieStorage = HTTPCookieStorage.shared
        cookieStorage.cookies?.forEach { cookie in
            cookieStorage.deleteCookie(cookie)
        }
    }
    
    /// 쿠키 이름으로 제거
    public func deleteCookie(name: String) {
        let cookieStorage = HTTPCookieStorage.shared
        cookieStorage.cookies?.forEach { cookie in
            if cookie.name == name {
                cookieStorage.deleteCookie(cookie)
            }
        }
    }
    
//    /// 쿠키 설정
//    public func setCookie(cookie: HTTPCookie,  completionHandler: (() -> Void)? = nil) {
//        webConfiguration?.nonPersistent.httpCookieStore.setCookie(cookie, completionHandler: completionHandler)
//    }
//
//    // MARK: - Private Methods
//    /// 웹 앱 사용 시 스크립트 실행을 위해 등록하는 부분
//    private func setUserContentController() {
//        if let config = self.configuration, let scriptNames = config.scriptNames, let handler = config.scriptMessageHandler {
//            scriptNames.forEach { name in
//                config.userContentController.add(handler, name: name)
//            }
//            config.webViewConfiguration.userContentController = config.userContentController
//        }
//    }
//
//    /// 쿠키 값 공유 설정, perefences 설정
//    private func setWebViewConfiguration() {
//        if let config = webConfiguration {
//            if config.isUseProcessPool {
//                config.webViewConfiguration.processPool = config.processPool
//            }
//            config.webViewConfiguration.preferences = config.preferences
//        }
//    }
//
//    /// native에서 웹 호출...
//    private func setEvaluateJavaScript() {
//        if let list = webConfiguration?.evaluateJavaScriptNames {
//            list.forEach { scriptName in
//                wbWebView.evaluateJavaScript(scriptName) { result, error in
//                    self.evaluateJavaScriptDelegate?.evaluateJavaScriptResult(name: scriptName, result: result, error: error)
//                }
//            }
//        }
//    }
}
