//
//  ContentView.swift
//  Music App Streaming
//
//  Created by Omar Leal on 11/1/22.
//

import SwiftUI

struct Album: Hashable {
    var id = UUID()
    var name: String
    var image: String
    var songs: [Songs]
}


struct Songs: Hashable {
    var id = UUID()
    var name: String
    var time: String
}

struct ContentView: View {
    
    var albums: [Album ] = [
    Album(name: "Paul McCarney", image: "Album3", songs: paulMacCarney),
    Album(name: "The Weeknd", image: "Album4", songs: weeknd),
    Album(name: "Miles David", image: "Album1", songs: albumData),
    Album(name: "Cerati", image: "Album2", songs: albumData),
    Album(name: "Paul McCarney", image: "Album3", songs: paulMacCarney),
    Album(name: "The Weeknd", image: "Album4", songs: weeknd),
    Album(name: "Miles David", image: "Album1", songs: albumData),
    Album(name: "Cerati", image: "Album2", songs: albumData),
    Album(name: "Paul McCarney", image: "Album3", songs: paulMacCarney),
    Album(name: "The Weeknd", image: "Album4", songs: weeknd),
    Album(name: "Miles David", image: "Album1", songs: albumData),
    Album(name: "Cerati", image: "Album2", songs: albumData),
    ]
    
    @State private var currentAlbum: Album?
    
    var body: some View {
        NavigationView{
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack {
                        ForEach(self.albums,id: \.self ,content: {
                            album in
                            AlbumArt(album: album)
                                .onTapGesture {
                                    self.currentAlbum = album
                                }
                        })
                    }
                })
                
                LazyVStack {
                    ForEach((self.currentAlbum?.songs ?? self.albums.first?.songs ) ?? paulMacCarney, id: \.self, content: {
                        song in
                        SongCell(songs: song)
                    })
                }
            }.navigationTitle("My Favorite Music")
        }
    }
}



struct AlbumArt: View {
    var album: Album
    var body: some View {
        ZStack {
           
            Image(album.image).resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
            ZStack {
                BlurEffect(style: .light)
                Text(album.name)
                    .foregroundColor(.white)
            }.frame( height: 40, alignment: .center)
                .cornerRadius(8)
        }.frame(width: 200, height: 200, alignment: .center)
        .clipped()
         .cornerRadius(8)
         //.shadow(radius: 10)
         .padding(20)
         
    }
}

struct SongCell: View {
    var songs: Songs
    var body: some View {
        HStack {
            ZStack {
                Circle().frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.blue)
                Circle().frame(width: 20, height: 20, alignment: .center)
                        .foregroundColor(.white)
            }
            Text(songs.name)
                .bold()
                Spacer()
            Text(songs.time)
        }.padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
