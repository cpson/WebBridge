//
//  WebBridgeConfiguration.swift
//  WebBridge
//
//  Created by 손창빈 on 2020/11/20.
//

import WebKit

public struct WebBridgeConfiguration {
    public init() {}
    
    /// 웹 관련 메시지 핸들러
    public var scriptMessageHandler: WKScriptMessageHandler? = nil
    
    /// WKProcessPool
    public var isUseProcessPool = false
    public let processPool = WKProcessPool()
    
    /// WKPreferences
    public let preferences = WKPreferences()
    
    /// WKWebViewConfiguration
    public let webViewConfiguration = WKWebViewConfiguration()
    
    /// nonPersistent
    public let nonPersistent = WKWebsiteDataStore.nonPersistent()

    /// 웹 <-> 폰 스크립트 네임
    public var scriptNames : [String]? = nil
    
    public var evaluateJavaScriptNames : [String]? = nil
    
    /// WKUserContentController
    public let userContentController = WKUserContentController()
}
