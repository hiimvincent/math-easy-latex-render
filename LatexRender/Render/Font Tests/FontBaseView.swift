//
//  FontBaseView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 1/27/22.
//

import SwiftUI
import WebKit
 
struct FontBaseView: UIViewRepresentable {
    let htmlString = """
    <!doctype html>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <html>
        <head>
            <style>
                body {
                    font-size: 36px;
                    font-family: "Avenir-Light"
                }
            </style>
        </head>
        <body>
            <div class="container">
                <div class="element">
                    Hello, <span class="custom">WKWebView!</span>
                </div>
            </div>
        </body>
    </html>
    """
    
    let htmlString2 = """
    <!doctype html>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <html>
        <head>
        </head>
        <body>
            <div class="container">
                <p style="font-size: 25px; font-family:Avenir-Light">Which font looks the best?</p>
                <p style="font-size: 25px; font-family:Avenir-Medium">Which font looks the best?</p>
                <p style="font-size: 25px; font-family:Avenir-Roman">Which font looks the best?</p>
                <p style="font-size: 25px; font-family:Avenir-Book">Which font looks the best?</p>
                <p style="font-size: 25px; font-family:Avenir-Black">Which font looks the best?</p>
                <p style="font-size: 25px; font-family:AvenirNext-Regular">Which font looks the best?</p>
                <p style="font-size: 25px; font-family:AvenirNext-UltraLight">Which font looks the best?</p>
                <p style="font-size: 25px; font-family:AvenirNext-Medium">Which font looks the best?</p>
            </div>
        </body>
    </html>
    """
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        //let bundleURL = Bundle.main.bundleURL
        webView.loadHTMLString(htmlString2, baseURL:  nil)
    }
}

//struct FontBaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        FontBaseView()
//    }
//}
