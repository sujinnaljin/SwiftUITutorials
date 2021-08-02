//
//  PageControl.swift
//  Landmarks
//
//  Created by 강수진 on 2021/08/03.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int

    //makeUIViewController(context:)함수가 호출되기 전에 자동으로 호출
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
                    context.coordinator,
                    action: #selector(Coordinator.updateCurrentPage(sender:)),
                    for: .valueChanged)
        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl

        init(_ control: PageControl) {
            self.control = control
        }

        //UIPageControl과 같은 UIControl 하위 클래스는 delegate 대신 target action 패턴을 사용하기 때문에 이 코디네이터는 @objc 메서드를 구현하여 현재 페이지 바인딩을 업데이트
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
