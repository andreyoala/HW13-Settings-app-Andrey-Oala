import UIKit

struct Section {
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

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
    
// MARK: - Configuring Cells
    func configureCells() {
        models.append(Section(options: [
            .switchCell(model: SettingsSwitchOption(title: Strings.airplaneModeTitle, icon: UIImage(systemName: Icons.airplaneModeIcon), iconBackgroundColor: .systemOrange, handler: {
            }, isOn: true)),
            .staticCell(model: SettingsOption(title: Strings.wifiTitle, icon: UIImage(systemName: Icons.wifiIcon), iconBackgroundColor: .systemBlue) {}),
            .staticCell(model: SettingsOption(title: Strings.bluetoothTitle, icon: UIImage(systemName: Icons.bluetoothIcon), iconBackgroundColor: .systemBlue) {}),
            .staticCell(model: SettingsOption(title: Strings.cellularTitle, icon: UIImage(systemName: Icons.cellularIcon), iconBackgroundColor: .systemGreen) {})
        ]))
        
        models.append(Section(options: [
            .staticCell(model: SettingsOption(title: Strings.notificationsTitle, icon: UIImage(systemName: Icons.notificationsIcon), iconBackgroundColor: .systemRed) {}),
            .staticCell(model: SettingsOption(title: Strings.soundsAndHapticsTitle, icon: UIImage(systemName: Icons.soundsAndHapticsIcon), iconBackgroundColor: .systemPink) {}),
            .staticCell(model: SettingsOption(title: Strings.focusModeTitle, icon: UIImage(systemName: Icons.focusModeIcon), iconBackgroundColor: .systemIndigo) {}),
            .staticCell(model: SettingsOption(title: Strings.screenTimeTitle, icon: UIImage(systemName: Icons.screenTimeIcon), iconBackgroundColor: .systemIndigo) {})
        ]))
        
        models.append(Section(options: [
            .staticCell(model: SettingsOption(title: Strings.generalOptionsTitle, icon: UIImage(systemName: Icons.generalOptionsIcon), iconBackgroundColor: .systemGray) {}),
            .staticCell(model: SettingsOption(title: Strings.controlCenterTitle, icon: UIImage(systemName: Icons.controlCenterIcon), iconBackgroundColor: .systemGray) {}),
            .staticCell(model: SettingsOption(title: Strings.displayAndBrightnessTitle, icon: UIImage(systemName: Icons.displayAndBrightnessIcon), iconBackgroundColor: .systemBlue) {}),
            .staticCell(model: SettingsOption(title: Strings.homeScreenTitle, icon: UIImage(systemName: Icons.homeScreenIcon), iconBackgroundColor: .systemIndigo) {}),
            .staticCell(model: SettingsOption(title: Strings.accessibilityTitle, icon: UIImage(systemName: Icons.accessibilityIcon), iconBackgroundColor: .systemBlue) {}),
            .staticCell(model: SettingsOption(title: Strings.wallpapersTitle, icon: UIImage(systemName: Icons.wallpapersIcon), iconBackgroundColor: .systemTeal) {}),
            .staticCell(model: SettingsOption(title: Strings.siriAndSearchTitle, icon: UIImage(systemName: Icons.siriAndSearchIcon), iconBackgroundColor: .black) {})
            ]))
}




