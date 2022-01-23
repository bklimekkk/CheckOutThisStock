//
//  ReadListManager.swift
//  newProject
//
//  Created by MAC on 19/11/2021.
//

import Foundation
//import Firebase


class ReadLaterManager: ObservableObject {
    @Published var readLater = [ReadLater]()
    init() {
        
        self.getRead()
        
    }
    
    func deleteRead (id: String) {
//        let db = Firestore.firestore()
//        db.collection("readLater").document(id).delete { error in
//            if(error == nil) {
//                DispatchQueue.main.async {
//                    self.readLater.removeAll { read in
//                        return read.id == id
//                    }
//                }
//            }
//        }
    }
    
    func addRead(title: String, author: String, image_url: String, article_url: String, name: String, logo_url: String) {
//        let db = Firestore.firestore()
//        let date = NSDate()
//        db.collection("readLater").addDocument(data: ["date" : Int(date.timeIntervalSince1970), "title" : title, "author" : author, "image_url" : image_url, "article_url" : article_url, "name" : name, "logo_url" : logo_url]) { error in
//            if error == nil {
//                self.getRead()
//            } else {
//                print(error)
//            }
//        }
    }
    
    func getRead() {
//        let db = Firestore.firestore()
//        db.collection("readLater").getDocuments { snapshot, error in
//            if error == nil {
//                if let snapshot = snapshot {
//                    DispatchQueue.main.async {
//
//                        self.readLater = snapshot.documents.map { d in
//                            return ReadLater(id: d.documentID,
//                                             date: d["date"] as? Int ?? 0,
//                                             title: d["title"] as? String ?? "",
//                                             author: d["author"] as? String ?? "",
//                                             image_url: d["image_url"] as? String ?? "",
//                                             article_url: d["article_url"] as? String ?? "",
//                                             name: d["name"] as? String ?? "",
//                                             logo_url: d["logo_url"] as? String ?? "")
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
