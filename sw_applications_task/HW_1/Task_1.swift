// Создать два проекта.
// В первом удалить все упоминания сториборд (проект 1).
// Во втором оставить (проект 2).

// Проект 1
// Удаление сториборд
// Открываю проект в Xcode.
// Открываю файл Info.plist.
// Удаляю строку Main storyboard file base name.
// Удаляю файлы Main.storyboard, LaunchScreen.storyboard.
// Редактирую файл AppDelegate.swift, чтобы убрать упоминания сториборд.

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = ViewController()
    window?.makeKeyAndVisible()
    return true
}

// Результат
// В проекте 1 все упоминания сториборд удалены и приложение будет запускаться без них.


// Проект 2
// Оставление сториборд
// Открываю проект в Xcode.
// Оставляю строку Main storyboard file base name в файле Info.plist.
// Редактирую файл AppDelegate.swift, чтобы оставить упоминания сториборд.

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    return true
}

// Результат
// В проекте 2 сториборд оставлен, и приложение будет запускаться с использованием сториборда.