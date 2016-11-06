import Foundation

extension Dictionary {
  
  func number(key: String) -> CGFloat? {
    if let key = key as? Key,
      let value = self[key] as? String,
      let number = Double(value) {
      return CGFloat(number)
    }
    
    return nil
  }
  
  func string(key: String) -> String? {
    if let key = key as? Key {
      return self[key] as? String
    }
    
    return nil
  }
  
  func color(key: String) -> UIColor? {
    if let value = string(key: key) {
      return Color.color(name: value)
    }
    
    return nil
  }
}
