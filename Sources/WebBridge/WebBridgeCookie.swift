//
//  File.swift
//  
//
//  Created by 손창빈 on 2021/03/16.
//

import Foundation

struct CookieHelper {
    
    /// 모든 쿠키 제거
    public func deleteAllCookies() {
        let cookieStorage = HTTPCookieStorage.shared
        cookieStorage.cookies?.forEach { cookie in
            cookieStorage.deleteCookie(cookie)
        }
    }
    
    /// 쿠키 이름으로 제거
    public func deleteCookieWithName(_ name: String) {
        let cookieStorage = HTTPCookieStorage.shared
        cookieStorage.cookies?.forEach { cookie in
            if cookie.name == name {
                cookieStorage.deleteCookie(cookie)
            }
        }
    }
    
    /// 쿠키 설정
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
