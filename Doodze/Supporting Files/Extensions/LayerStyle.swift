//
//  LayerStyle.swift
//  Doodze
//
//  Created by Богдан Баринов on 11.11.2022.
//

import UIKit

enum LayerStyleType {
    case none
    case sheetsTop
    case sheetsBottom
    case trackers20
    case trackers40(additionalLayer: CALayer)
    case buttonDark
    case buttonLight(additionalLayer: CALayer)
    case buttonSheet
    case actionButton
    case custom(offset: CGPoint, blur: CGFloat, spread: CGFloat, color: UIColor, alpha: CGFloat)

    var value: LayerStyle<CALayer> {
        switch self {
        case .none:
            return LayerStyle<CALayer> {
                $0.applySketchShadow(color: .clear, alpha: .zero, x: .zero, y: .zero, blur: .zero, spread: .zero)
            }
        case .sheetsTop:
            return LayerStyle<CALayer> {
                $0.applySketchShadow(color: .black, alpha: 0.1, x: .zero, y: -4, blur: 10, spread: .zero)
            }
        case .sheetsBottom:
            return LayerStyle<CALayer> {
                $0.applySketchShadow(color: .textTapPrimary, alpha: 0.1, x: .zero, y: 4, blur: 10, spread: .zero)
            }
        case .trackers20:
            return LayerStyle<CALayer> {
                $0.applySketchShadow(color: .trackers20, alpha: 0.2, x: .zero, y: 4, blur: 13, spread: -7)
                $0.shadowPath = nil
            }
        case let .trackers40(additionalLayer):
            return LayerStyle<CALayer> {
                $0.applySketchShadow(color: .purple, alpha: 0.3, x: .zero, y: 13, blur: 12, spread: -7)
                additionalLayer.applySketchShadow(color: .purple, alpha: 0.1, x: .zero, y: -2, blur: 8, spread: -2)

                fixSublayerIndex(parentLayer: $0, sublayer: additionalLayer)
            }
        case .buttonDark:
            return LayerStyle<CALayer> {
                $0.applySketchShadow(color: .black, alpha: 0.1, x: .zero, y: 15, blur: 12, spread: -11)
            }
        case let .buttonLight(additionalLayer):
            return LayerStyle<CALayer> {
                $0.applySketchShadow(color: .trackers20, alpha: 0.4, x: .zero, y: 17, blur: 11, spread: -13)
                additionalLayer.applySketchShadow(color: .trackers20, alpha: 0.25, x: .zero, y: -2, blur: 12, spread: -5)
            }
        case .buttonSheet:
            return LayerStyle<CALayer> {
                $0.applySketchShadow(color: .buttonSheet, alpha: 0.08, x: .zero, y: -4, blur: 11, spread: .zero)
            }
        case .actionButton:
            return LayerStyle<CALayer> {
                $0.applySketchShadow(color: .textPositive, alpha: 0.4, x: .zero, y: 17, blur: 11, spread: -13)
            }
        case let .custom(offset, blur, spread, color, alpha):
            return LayerStyle<CALayer> {
                $0.applySketchShadow(color: color, alpha: Float(alpha), x: offset.x, y: offset.y, blur: blur, spread: spread)
            }
        }
    }

    private func fixSublayerIndex(parentLayer: CALayer, sublayer: CALayer) {
        let sublayers = parentLayer.sublayers ?? []
        guard sublayers.count > 1, sublayers.last === sublayer else { return }

        sublayer.removeFromSuperlayer()
        parentLayer.insertSublayer(sublayer, at: .zero)
    }
}

struct LayerStyle<Layer: CALayer> {

    let style: (Layer) -> Void

    init(_ style: @escaping (Layer) -> Void) {
        self.style = style
    }

    func apply(to view: Layer) {
        style(view)
    }

}

extension CALayer {

    func apply(_ styles: LayerStyleType...) {
        styles.forEach { $0.value.apply(to: self) }
    }

    func apply(_ styles: [LayerStyleType]) {
        styles.forEach { $0.value.apply(to: self) }
    }

}

extension UIView {

    func apply(_ styles: LayerStyleType...) {
        layer.backgroundColor = backgroundColor?.cgColor
        layer.apply(styles)
    }

}
