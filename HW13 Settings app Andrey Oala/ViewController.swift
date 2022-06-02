//
//  ViewController.swift
//  HW13 Settings app Andrey Oala
//
//  Created by Andrey Oala on 02.06.2022.
//

import UIKit




class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let settingsNames = [["Airplane Mode", "Wi-Fi", "Bluetooth", "Cellular"],
                             ["Notifications", "Sounds & Haptics", "Focus", "Screen Time"],
                             ["General", "Control Center", "Display & Brightness", "Home Screen", "Accessibility", "Wallpapers", "Siri & Search"]]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = settingsNames[indexPath.section][indexPath.row]
        return cell
    }
    

    private let tableVIew: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.addSubview(tableVIew)
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.frame = view.bounds
    }


}

extension ViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
            let text = cell?.textLabel?.text
            if let text = text {
                print("Нажата ячейка \(text)")
            }
    }
}

