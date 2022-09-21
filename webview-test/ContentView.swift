//
//  ContentView.swift
//  webview-test
//
//  Created by Zhihao Cui on 21/09/2022.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> WKWebView  {
//        let preferences = WKPreferences()
//        preferences.javaScriptEnabled = true
//        let configuration = WKWebViewConfiguration()
//        configuration.preferences = preferences
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "build")!
        print(url.absoluteString)
        let htmlString =  try! String(contentsOf: url, encoding: .utf8)
        print(htmlString)
        
        
        let urlDir = url.deletingLastPathComponent()
        print(urlDir)

//        webView.configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        webView.configuration.defaultWebpagePreferences.allowsContentJavaScript = true
//        webView.configuration.preferences.javaScriptEnabled = true
        webView.loadFileURL(url, allowingReadAccessTo: urlDir)
//        webView.loadHTMLString(htmlString, baseURL: urlDir)
        
        
//        let request = URLRequest(url: url)
//        webView.load(request)
//        webView.evaluateJavaScript("document.body.outerHTML") { (result, error) in
//            if error == nil {
//                print(result)
//            } else {
//                print(error)
//            }
//        }
    }
    
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            WebView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
