import Foundation
import SwiftUI
import FirebaseFirestore


class DataManager: ObservableObject {
    @Published public var albums2 = [Album]()
    
    func loadAlbums () {
        Firestore.firestore().collection("albums").getDocuments(completion: { (snapshot, error) in
            if error == nil {
                for document in snapshot!.documents {
                    let name = document.data()["name"] as? String ?? "error song"
                    let time = document.data()["time"] as? String ?? "error song"
                    let image = document.data()["image"] as? String ?? "image error"
                    let songs = document.data()["songs"] as? [String: [String: Any]]
                    
                    var songsCollection = [Songs]()
                    
                    if let songs = songs {
                        for song in songs {
                           let songName =  song.value["name"] as? String ?? "error"
                            let songTime = song.value["time"] as? String ?? "error time song"
                            songsCollection.append(Songs(name: songName, time: songTime))
                        }
                    }
                    
                    self.albums2.append(Album(name: name, image: image, songs: songsCollection))
                    print("hello there firebase")
                }
            } else {
                print("Somenthing is wrong")
            }
            
            
        })
    }
}
