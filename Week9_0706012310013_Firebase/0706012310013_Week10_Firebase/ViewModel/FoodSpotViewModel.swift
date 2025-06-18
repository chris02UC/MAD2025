//
//  FoodSpotViewModel.swift
//  0706012310013_Week10_Firebase
//
//  Created by student on 02/05/25.
//

import Foundation
import FirebaseCore   
import FirebaseDatabase
import FirebaseAuth

class FoodSpotViewModel: ObservableObject {
    @Published var foodSpots: [FoodSpotModel] = []
    private var ref = Database.database().reference().child("foodspots")
    private let isPreview: Bool

    var currentUserId: String? {
        guard !isPreview else { return nil }
        return Auth.auth().currentUser?.uid
    }
    
    
    init(useMock: Bool = false) {
        self.isPreview = useMock

        if useMock {
        } else {
            if FirebaseApp.app() == nil {
                FirebaseApp.configure()
            }
            self.ref = Database.database().reference().child("foodspots")
            fetchFoodSpots()
        }
    }

    func fetchFoodSpots() {
        guard
            !isPreview,
            let uid = currentUserId
        else { return }

        ref.observe(.value) { snapshot in
            guard let dict = snapshot.value as? [String: Any] else {
                self.foodSpots = []
                return
            }

            self.foodSpots = dict.compactMap { _, spot in
                guard
                    let spotDict = spot as? [String: Any],
                    let data = try? JSONSerialization.data(withJSONObject: spotDict),
                    let model = try? JSONDecoder().decode(FoodSpotModel.self, from: data),
                    model.userId == uid
                else { return nil }
                return model
            }
        }
    }

    func deleteFoodSpot(_ spot: FoodSpotModel) {
        guard !isPreview else { return }
        ref.child(spot.id).removeValue()
    }

    func addFoodSpot(_ spot: FoodSpotModel) {
        foodSpots.append(spot)

        guard !isPreview else {
            print("⚠️ Skipping Firebase write in preview")
            return
        }

        guard
            let data = try? JSONEncoder().encode(spot),
            let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any]
        else {
            print("❌ Encoding failed")
            return
        }

        ref.child(spot.id).setValue(json) { error, _ in
            if let e = error {
                print("❌ Write error:", e.localizedDescription)
            } else {
                print("✅ Wrote spot \(spot.id) to Firebase")
            }
        }
    }

}


