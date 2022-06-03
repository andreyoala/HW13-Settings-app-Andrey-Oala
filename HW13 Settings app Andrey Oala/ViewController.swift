import UIKit

struct Section {
    let options: [SettingsOption]
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var models = [Section]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func configureCells() {
        models.append(Section(options: [
            SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange) {
            },
            SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue) {
            },
            SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "point.3.connected.trianglepath.dotted"), iconBackgroundColor: .systemBlue) {
                
            },
            SettingsOption(title: "Cellular", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen) {
                
            }
        ]))
        models.append(Section(options: [
            SettingsOption(title: "Notifications", icon: UIImage(systemName: "app.badge.fill"), iconBackgroundColor: .systemRed) {
                
            },
            SettingsOption(title: "Sounds & Haptics", icon: UIImage(systemName: "speaker.wave.3"), iconBackgroundColor: .systemPink) {
                
            },
            SettingsOption(title: "Focus", icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemIndigo) {
                
            },
            SettingsOption(title: "Screen Time", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemIndigo) {
                
            }
        ]))
        models.append(Section(options: [
            SettingsOption(title: "General", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray) {
                
            },
            SettingsOption(title: "Control Center", icon: UIImage(systemName: "switch.2"), iconBackgroundColor: .systemGray) {
                
            },
            SettingsOption(title: "Display & Brightness", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue) {
                
            },
            SettingsOption(title: "Home Screen", icon: UIImage(systemName: "app.badge.fill"), iconBackgroundColor: .systemIndigo) {
                
            },
            SettingsOption(title: "Accessibility", icon: UIImage(systemName: "figure.wave.circle"), iconBackgroundColor: .systemBlue) {
                
            }
            ,
            SettingsOption(title: "Wallpapers", icon: UIImage(systemName: "photo.fill"), iconBackgroundColor: .systemTeal) {
                
            },
            SettingsOption(title: "Siri & Search", icon: UIImage(systemName: "h.square.on.square.fill"), iconBackgroundColor: .black) {
                
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
            let text = model.title
                print("Нажата ячейка \(text)")
        model.handler()
    }
}


