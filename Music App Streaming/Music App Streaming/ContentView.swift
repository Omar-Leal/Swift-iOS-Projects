//
//  ContentView.swift
//  Music App Streaming
//
//  Created by Omar Leal on 11/1/22.
//

import SwiftUI
import FirebaseStorage

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
    
    @ObservedObject var data: DataManager
    
    @State private var currentAlbum: Album?
    
    var body: some View {
        NavigationView{
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack {
                        ForEach(self.data.albums2,id: \.self ,content: {
                            album in
                            AlbumArt(album: album)
                                .onTapGesture {
                                    self.currentAlbum = album
                                }
                        })
                    }
                })
                
                LazyVStack {
                    if self.data.albums2.first == nil {
                        EmptyView()
                       
                    } else  {
                        ForEach((self.currentAlbum?.songs ?? self.data.albums2.first?.songs ) ?? paulMacCarney, id: \.self, content: {
                            song in
                            SongCell(album: currentAlbum ?? self.data.albums2.first!, songs: song)
                        })
                    }
                        
                }
            }.navigationTitle("My Favorite Music")
        }
    }
}



struct AlbumArt: View {
   
    var album: Album
    var isWithText: Bool = true
    
    var body: some View {
        ZStack {
           
            Image(album.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(20)
               
        }
        .frame(width: 200, height: 200, alignment: .center)
        .clipped()
         //.cornerRadius(20)
         //.shadow(radius: 10)
         .padding(20)
         
    }
}

struct SongCell: View {
    var album: Album
    var songs: Songs
    var body: some View {
        NavigationLink(
            destination: PlayerView(album: album, song: songs),
              label: {
                  HStack {
                      ZStack {
                          Circle().frame(width: 40, height: 40, alignment: .center)
                                  .foregroundColor(.blue)
                          Circle().frame(width: 20, height: 20, alignment: .center)
                                  .foregroundColor(.white)
                      }
                      Text(songs.name)
                          .font(Font.custom("Avenir", size: 16))
                          .bold()
                          Spacer()
                      Text(songs.time)
                  }.padding(20)
                  
                  
                  
                  
              }).buttonStyle(PlainButtonStyle())
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(data: DataManager())
        
    }
}
