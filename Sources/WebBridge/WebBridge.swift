
import WebKit

public protocol EvaluateJavaScriptDelegate: NSObjectProtocol {
    func evaluateJavaScriptResult(name: String, result: Any?, error: Error?)
}

open class WebBridge: NSObject {
    
    private var wbWebView: WKWebView!
    public weak var evaluateJavaScriptDelegate: EvaluateJavaScriptDelegate? = nil
    
    public var webView: WKWebView {
        return wbWebView
    }
    
    // MARK: - Init or Deinit
    public required init(frame: CGRect = .zero, configuration: WebBridgeConfiguration) {
        super.init()
        initWithConfiguration(configuration)
    }
    
    public convenience init(frame: CGRect = .zero) {
        self.init(frame: frame, configuration: WebBridgeConfiguration.shared)
    }
    
    deinit {
        print("WebBridge deinit 😀")
    }
    
    // MARK: - WebView Init
    private func initWithConfiguration(_ configuration: WebBridgeConfiguration) {
        WebBridgeConfiguration.shared = configuration
        setUserContentController()
        setWebViewConfiguration()
        setEvaluateJavaScript()
        wbWebView = WKWebView(frame: .zero, configuration: WebBridgeConfiguration.shared.webViewConfiguration)
    }
    
    /// 부모뷰와 동일한 크기로 autolayout 값 설정
    public func addSubViewWithLayoutConstraint(view: UIView) {
        view.addSubview(wbWebView)
        wbWebView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: wbWebView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: wbWebView.trailingAnchor),
            view.topAnchor.constraint(equalTo: wbWebView.topAnchor),
            view.bottomAnchor.constraint(equalTo: wbWebView.bottomAnchor)
            ])
    }

    // MARK: - load 함수
    /// url, urlrequest 귀찮아서 작성해 놓음..
    public func load(address: String) {
        if let url = URL(string: address) {
            wbWebView.load(URLRequest(url: url))
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
    
    /// 쿠키 설정
    public func setCookie(cookie: HTTPCookie,  completionHandler: (() -> Void)? = nil) {
        WBConfig.nonPersistent.httpCookieStore.setCookie(cookie, completionHandler: completionHandler)
    }
    
    // MARK: - Private Methods
    /// 웹 앱 사용 시 스크립트 실행을 위해 등록하는 부분
    private func setUserContentController() {
        if let scriptNames = WBConfig.scriptNames, let handler = WBConfig.scriptMessageHandler {
            scriptNames.forEach { name in
                WBConfig.userContentController.add(handler, name: name)
            }
            WBConfig.webViewConfiguration.userContentController = WBConfig.userContentController
        }
    }
    
    /// 쿠키 값 공유 설정, perefences 설정
    private func setWebViewConfiguration() {
        if WBConfig.isUseProcessPool {
            WBConfig.webViewConfiguration.processPool = WBConfig.processPool
        }
        WBConfig.webViewConfiguration.preferences = WBConfig.preferences
    }
    
    /// native에서 웹 호출...
    private func setEvaluateJavaScript() {
        if let list = WBConfig.evaluateJavaScriptNames {
            list.forEach { scriptName in
                wbWebView.evaluateJavaScript(scriptName) { result, error in
                    self.evaluateJavaScriptDelegate?.evaluateJavaScriptResult(name: scriptName, result: result, error: error)
                }
            }
        }
    }
}
