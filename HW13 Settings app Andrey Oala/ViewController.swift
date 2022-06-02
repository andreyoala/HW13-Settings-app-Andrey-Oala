import UIKit

struct Section {
    let title: String
    let options: [SettingsOption]
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var settingsNames = [["Airplane Mode", "Wi-Fi", "Bluetooth", "Cellular"],
                             ["Notifications", "Sounds & Haptics", "Focus", "Screen Time"],
                             ["General", "Control Center", "Display & Brightness", "Home Screen", "Accessibility", "Wallpapers", "Siri & Search"]]
    // let settingsImages = ["airplane", "wifi", "point.3.connected.trianglepath.dotted", "antenna.radiowaves.left.and.right", "app.badge.fill", "speaker.wave.3", "moon.fill", "hourglass", "gear", "switch.2", "textformat.size", "app.badge.fill", "figure.wave.circle", "photo.fill", "h.square.on.square.fill"]
    var models = [Section]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func configureCells() {
        models.append(Section(title: "General", options: [
            SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                
            },
            SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemGreen) {
                
            },
            SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "point.3.connected.trianglepath.dotted"), iconBackgroundColor: .systemGreen) {
                
            },
            SettingsOption(title: "Cellular", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen) {
                
            },
            SettingsOption(title: "Notifications", icon: UIImage(systemName: "app.badge.fill"), iconBackgroundColor: .systemGreen) {
                
            },
            SettingsOption(title: "Sounds & Haptics", icon: UIImage(systemName: "speaker.wave.3"), iconBackgroundColor: .systemGreen) {
                
            },
            SettingsOption(title: "Focus", icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemGreen) {
                
            },
            SettingsOption(title: "Screen Time", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemGreen) {
                
            },
            SettingsOption(title: "General", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGreen) {
                
            },
            SettingsOption(title: "Control Center", icon: UIImage(systemName: "switch.2"), iconBackgroundColor: .systemGreen) {
                
            },
            SettingsOption(title: "Display & Brightness", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemGreen) {
                
            }
            
            ]))

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.indentifier,
                                                 for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    

    private let tableVIew: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.indentifier)
        return table
    }()
    
    
    override func viewDidLoad() {
        configureCells()
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
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
        let cell = tableView.cellForRow(at: indexPath)
            let text = cell?.textLabel?.text
            if let text = text {
                print("Нажата ячейка \(text)")
            }
    }
}

