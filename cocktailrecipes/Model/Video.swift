//
//  Video.swift
//  Salun
//
//  Created by Jessie Price on 3/14/24.
//

import Foundation
import WebKit
import SwiftUI


struct Video: UIViewRepresentable{
    let videoID: String
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        let videoStringArray = videoID.components(separatedBy: "=")
        guard let YoutubeURL = URL(string: "https://www.youtube.com/embed/\(videoStringArray.last!)")else{return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: YoutubeURL))
    }
}

//struct VideoView: View{
//    var body: some View{
//
//    }
//}
