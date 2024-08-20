import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var mulButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var ekranGiris: UIView!
    @IBOutlet weak var firstNumberTxt: UITextField!
    @IBOutlet weak var secondNumberTxt: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var previousResultLabel: UILabel!
    
    var result = 0
    var selectedOperation: String?
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        self.view.backgroundColor = .white
        setUI()
        setObj()
                       

    }
    
    func setUI(){
        firstNumberTxt.delegate = self
        secondNumberTxt.delegate = self
        
        firstNumberTxt.placeholder = "Birinci Sayı"
        secondNumberTxt.placeholder = "İkinci Sayı"
    
        firstNumberTxt.keyboardType = .numberPad
        secondNumberTxt.keyboardType = .numberPad
        
        resultLabel.text = "   "
        resultLabel.numberOfLines = 1
        
        calculateButton.layer.cornerRadius = 10
        calculateButton.layer.masksToBounds = true
        
        logOutButton.layer.cornerRadius = 10
        logOutButton.layer.masksToBounds = true
        
        addButton.layer.cornerRadius = 10
        addButton.layer.masksToBounds = true
        subButton.layer.cornerRadius = 10
        subButton.layer.masksToBounds = true
        mulButton.layer.cornerRadius = 10
        mulButton.layer.masksToBounds = true
        
        previousResultLabel.text = "   "
        previousResultLabel.numberOfLines = 1
        
    }
    func setObj(){
        previousResultLabel.isHidden = true
        
        if let previousResult = userDefaults.string(forKey: "previousResult"), !previousResult.isEmpty {
            previousResultLabel.text = "Önceki Sonuç : \(previousResult)"
            previousResultLabel.isHidden = false
        } else {
            previousResultLabel.isHidden = true
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        selectedOperation = "+"
    }
    
    @IBAction func subButton(_ sender: Any) {
        selectedOperation = "-"
    }
    
    @IBAction func mulButton(_ sender: Any) {
        selectedOperation = "x"
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        guard let firstNumber = Int(firstNumberTxt.text ?? ""),
              let secondNumber = Int(secondNumberTxt.text ?? ""),
              let operation = selectedOperation else {
            resultLabel.text = "Enter valid numbers and select an operation"
            return
        }
        
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "x":
            result = firstNumber * secondNumber
        default:
            resultLabel.text = "Invalid operation"
            return
        }
        
        resultLabel.text = "Sonuç : \(result)"
        let previousResult = userDefaults.string(forKey: "previousResult")
        
        
        if let previousResult = previousResult, !previousResult.isEmpty {
            previousResultLabel.text = "Önceki Sonuç : \(previousResult)"
            previousResultLabel.isHidden = false
        } else {
            previousResultLabel.isHidden = true
        }
        userDefaults.set("\(result)", forKey: "previousResult")
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
        self.dismiss(animated: false, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

    


    



    



 


