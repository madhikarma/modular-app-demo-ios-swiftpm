
public class SharedUtil {
    public init() {}

    public func someSharedUtilFunction() -> String {
        return "someSharedUtilFunction"
    }
}

import Alamofire
import Foundation

public class Networking {
    public init() {}

    public func sendJSONRequest(url: URL, completion: @escaping (AFDataResponse<Any>) -> Void) {
        let request = AF.request(url)
        // 2
        request.responseJSON { data in
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}

import Realm
import RealmSwift

public class Persistence {
    private let realm = try! Realm()
    public lazy var categories: Results<Category> = { self.realm.objects(Category.self) }()

    public init(directory _: URL) {
        // TODO: support creating Realm / other Database at a custom directory
//        let config = Realm.Configuration(
//            // Get the URL to the bundled file
//            fileURL: Bundle.main.url(forResource: "MyBundledData", withExtension: "realm"),
//            // Open the file in read-only mode as application bundles are not writeable
//            readOnly: true)
//
//        // Open the Realm with the configuration
//        let realm = try! Realm(configuration: config)

        populateDefaultCategories()
    }

    public func getDirectory() -> URL {
        return Realm.Configuration.defaultConfiguration.fileURL!
    }

    private func populateDefaultCategories() {
        if categories.count == 0 { // 1
            try! realm.write { // 2
                let defaultCategories =
                    ["Birds", "Mammals", "Flora", "Reptiles", "Arachnids"] // 3

                for category in defaultCategories { // 4
                    let newCategory = Category()
                    newCategory.name = category

                    realm.add(newCategory)
                }
            }

            categories = realm.objects(Category.self) // 5
        }
    }
}

public class Specimen: Object {
    @objc dynamic var name = ""
    @objc dynamic var specimenDescription = ""
    @objc dynamic var latitude = 0.0
    @objc dynamic var longitude = 0.0
    @objc dynamic var created = Date()
}

public class Category: Object {
    @objc dynamic var name = ""
}
