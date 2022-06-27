import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableVIew: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.indentifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.indentifier)
        return table
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.indentifier,
            for: indexPath) as? SettingsTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.indentifier,
            for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCells()
        view.addSubview(tableVIew)
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.frame = view.bounds
        title = "Settings"
    }
}


extension ViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
            print("Нажата ячейка \(model.title)")
        case .switchCell(let model):
            model.handler()
            print("Нажата ячейка \(model.title)")
        }
    }
}

var models = [Section]()

// MARK: - Strings
enum Strings {
    static let airplaneModeTitle = "Airplane Mode"
    static let wifiTitle = "Wi-Fi"
    static let bluetoothTitle = "Bluetooth"
    static let cellularTitle = "Cellular"
    static let notificationsTitle = "Notifications"
    static let soundsAndHapticsTitle = "Sounds & Haptics"
    static let focusModeTitle = "Focus"
    static let screenTimeTitle = "Screen Time"
    static let generalOptionsTitle = "General"
    static let controlCenterTitle = "Control Center"
    static let displayAndBrightnessTitle = "Display & Brightness"
    static let homeScreenTitle = "Home Screen"
    static let accessibilityTitle = "Accessibility"
    static let wallpapersTitle = "Wallpapers"
    static let siriAndSearchTitle = "Siri & Search"
}

// MARK: - Icons
enum Icons {
    static let airplaneModeIcon = "airplane"
    static let wifiIcon = "wifi"
    static let bluetoothIcon = "point.3.connected.trianglepath.dotted"
    static let cellularIcon = "antenna.radiowaves.left.and.right"
    static let notificationsIcon = "app.badge.fill"
    static let soundsAndHapticsIcon = "speaker.wave.3"
    static let focusModeIcon = "moon.fill"
    static let screenTimeIcon = "hourglass"
    static let generalOptionsIcon = "gear"
    static let controlCenterIcon = "switch.2"
    static let displayAndBrightnessIcon = "textformat.size"
    static let homeScreenIcon = "app.badge.fill"
    static let accessibilityIcon = "figure.wave.circle"
    static let wallpapersIcon = "photo.fill"
    static let siriAndSearchIcon = "h.square.on.square.fill"
}




