import UIKit

class PasswordViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    let password = "12345"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.delegate = self
        setupUI()
        
        guard let tableView = tableView else {
            print("tableView is nil")
            return
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "FirstCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FirstCell")
    }
    
    func setupUI() {
        self.view.backgroundColor = .white
        loginButton.backgroundColor = UIColor(red: 0.63, green: 0.48, blue: 0.65, alpha: 1.00)
        loginButton.layer.cornerRadius = 6
        passwordTextField.placeholder = "Şifrenizi girin:"
        passwordTextField.textColor = .black
        passwordTextField.textAlignment = .left
        continueButton.backgroundColor = UIColor(red: 0.63, green: 0.48, blue: 0.65, alpha: 1.00)
        continueButton.layer.cornerRadius = 6
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if passwordTextField.text == password {
            showMainScreen()
        } else {
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Hata", message: "Yanlış şifre", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showMainScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainVC = storyboard.instantiateViewController(identifier: "MainViewController") as? MainViewController {
            mainVC.modalPresentationStyle = .fullScreen
            present(mainVC, animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
    }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstCell
            
            
            return cell
        
    }
        @IBAction func continueButtonTapped(_ sender: Any) {
            showTableViewScreen()
        }

        func showTableViewScreen() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let newViewController = storyboard.instantiateViewController(withIdentifier: "NewViewController") as? NewViewController else {
                print("NewViewController not found in storyboard")
                return
            }
            newViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }


  /*  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstCell
        cell.titleLabel.text = "Title \(indexPath.row + 1)"
        cell.customTextLabel?.text = "Data,Data,Data \(indexPath.row + 1)"
        return cell
    }
}*/







    





