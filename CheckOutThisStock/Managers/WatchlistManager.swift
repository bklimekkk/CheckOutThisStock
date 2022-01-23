//
//  WatchlistManager.swift
//  newProject
//
//  Created by MAC on 19/11/2021.
//

import Foundation
//import Firebase


class WatchlistManager: ObservableObject {
    @Published var watchlist = [Watchlist]()
    
    //here watchlist is populated with data
    init() {
        self.getWatchlist()
    }
    
    func deleteData (id: String) {
//        let db = Firestore.firestore()
//        db.collection("watchlist").document(id).delete { error in
//            if(error == nil) {
//                DispatchQueue.main.async {
//                    self.watchlist.removeAll { watchlist in
//                        return watchlist.id == id
//                    }
//                }
//            }
//        }
    }
    func addData(ticker: String, company: String, image: String) {
//        let db = Firestore.firestore()
//
//
//        db.collection("watchlist").addDocument(data: ["ticker" : ticker, "company" : company, "image" : image]) { error in
//            if error == nil {
//                self.getWatchlist()
//            } else {
//                print(error)
//            }
//        }
    }
    
    func getWatchlist() {
//        let db = Firestore.firestore()
//        db.collection("watchlist").getDocuments { snapshot, error in
//            if error == nil {
//                if let snapshot = snapshot {
//                    DispatchQueue.main.async {
//                        self.watchlist = snapshot.documents.map { d in
//                            return Watchlist(id: d.documentID,
//                                             ticker: d["ticker"] as? String ?? "",
//                                             company: d["company"] as? String ?? "",
//                                             image: d["image"] as? String ?? "")
//
//                        }
//                    }
//
//
//                }
//
//            } else {
//
//                print(error)
//            }
//
//        }
        
        
        
        
    }
}
