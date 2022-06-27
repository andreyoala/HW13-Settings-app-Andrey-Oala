import UIKit

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
