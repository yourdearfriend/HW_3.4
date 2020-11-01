//
//  UISlider.swift
//  transitSwiftUIApp
//
//  Created by Konstantin on 28.10.2020.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    
    @Binding var value: Double
    var searchValue: Int
    
    var color: UIColor
    var alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = color
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged),
                         for: .valueChanged)
    
        return slider
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> ColorUISlider.Coordinator {
        Coordinator(value: $value)
    }
    
}

extension ColorUISlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
        
    }
}


struct ColorUISlider_Previews: PreviewProvider {
    
    static var previews: some View {
        ColorUISlider(value: .constant(100), searchValue: 1, color: .red, alpha: 1)
    }
}
