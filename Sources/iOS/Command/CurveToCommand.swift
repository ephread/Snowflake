import Foundation

class CurveToCommand: Command {
  var controlPoint1: CGPoint = .zero
  var controlPoint2: CGPoint = .zero
  var endPoint: CGPoint = .zero

  required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count == 6 {
      controlPoint1 = CGPoint(x: numbers[0], y: numbers[1])
      controlPoint2 = CGPoint(x: numbers[2], y: numbers[3])
      endPoint = CGPoint(x: numbers[4], y: numbers[5])
    }
  }

  override func act(path: UIBezierPath) {
    switch kind {
    case .absolute:
      path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
    case .relative:
      path.addCurve(to: path.currentPoint.add(p: endPoint),
                    controlPoint1: path.currentPoint.add(p: controlPoint1),
                    controlPoint2: path.currentPoint.add(p: controlPoint2))
    }
  }
}