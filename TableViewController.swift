import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var namesArray: [String] = [
        "Ahmet", "Mehmet", "Ayşe", "Fatma", "Ali", "Veli", "Hasan", "Hüseyin", "Emine", "Zeynep",
        "Murat", "Merve", "Burak", "Deniz", "Esra", "Buse", "Selin", "Yusuf", "Elif", "Kaan",
        "Okan", "Ece", "Furkan", "Derya", "Berke", "İzem", "Serkan", "Naz", "Özge", "Cem"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
       
    }
    func setTableView(){
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        tableViewOutlet.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = namesArray[indexPath.row]
        return cell
        
    }
    
   /* override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = namesArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me!")
    } */
    
}

