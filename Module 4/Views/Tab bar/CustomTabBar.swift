//
//  CustomTabBar.swift
//  Module 4
//
//  Created by Влад Бокин on 16.08.2022.
//

import UIKit

final class CustomTabBar: UITabBar {

    // MARK: - Constants
    private enum Constants {
        static let circleRadius: CGFloat = 27
    }
    
    // MARK: - properties
    private var tabBarWidth: CGFloat { self.bounds.width }
    private var tabBarHeight: CGFloat { self.bounds.height }
    private var centerWidth: CGFloat { self.bounds.width / 2 }
    

    override func draw(_ rect: CGRect) {
        drawTabBar()
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let pointIsInside = super.point(inside: point, with: event)
        if pointIsInside == false {
            for subview in subviews {
                let pointInSubview = subview.convert(point, from: self)
                if subview.point(inside: pointInSubview, with: event) {
                    return true
                }
            }
        }
        return pointIsInside
    }

    private func shapePath() -> CGPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: tabBarWidth, y: 0))
        path.addLine(to: CGPoint(x: tabBarWidth, y: tabBarHeight))
        path.addLine(to: CGPoint(x: 0, y: tabBarHeight))
        path.close()
        return path.cgPath
    }

    private func circlePath() -> CGPath {
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: centerWidth, y: 12),
                    radius: Constants.circleRadius,
                    startAngle: 180 * .pi / 180,
                    endAngle: 0 * 180 / .pi,
                    clockwise: true)
        return path.cgPath
    }

    private var shapeLayer: CALayer?
    private var circleLayer: CALayer?
    private var gradientLayer: CALayer?

    func drawTabBar() {

        // MARK: - shape
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shapePath()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.whiteColor.cgColor
        shapeLayer.lineWidth = 1.0

        // MARK: - circle
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath()
        circleLayer.strokeColor = UIColor.lightGray.cgColor
        circleLayer.fillColor = UIColor.whiteColor.cgColor
        circleLayer.lineWidth = 1.0

        // MARK: - gradient
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: (self.layer.frame.width / 5) * 2, y: 2, width: 75, height: 10)
        gradient.colors = [UIColor.lightGray.cgColor,
                           UIColor.whiteColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)

        if let oldShapeLayer = self.shapeLayer {
                self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
            } else {
                self.layer.insertSublayer(shapeLayer, at: 0)
            }

        if let oldCircleLayer = self.circleLayer {
            self.layer.replaceSublayer(oldCircleLayer, with: circleLayer)
        } else {
            self.layer.insertSublayer(circleLayer, at: 1)
        }

        self.shapeLayer = shapeLayer
        self.circleLayer = circleLayer
        self.gradientLayer = gradient

//        self.circleLayer?.addSublayer(gradientLayer!)
//        self.circleLayer?.masksToBounds = false
        }

}
