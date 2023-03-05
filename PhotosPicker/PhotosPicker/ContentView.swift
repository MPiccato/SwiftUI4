//
//  ContentView.swift
//  PhotosPicker
//
//  Created by Martin Piccato on 05/03/2023.
//

import SwiftUI
import PhotosUI

final class ViewModel: ObservableObject {
    @Published var photoSelection: PhotosPickerItem? {
        
        didSet {
            if let photoSelection {
                loadTransferable(from: photoSelection)
            }
        }
    }
    @Published var image: [Image] = [Image(systemName: "photo.on.rectangle.angled")]
    
    private func loadTransferable(from photoSelection: PhotosPickerItem){
        photoSelection.loadTransferable(type: Data.self) { result in
            DispatchQueue.main.async {
                guard photoSelection == self.photoSelection else {return}
                switch result {
                case .success(let data):
                    let uiImage = UIImage(data:data!)
                    self.image.append(Image(uiImage: uiImage!))
                case .failure(let error):
                    print("Error load transferible \(error)")
                    self.image.append(Image(systemName: "mutiply.circle.fill"))
                    
                }
            }
        }
    }
}

extension Image: Identifiable {
    public var id: String { UUID().uuidString}
}

struct ContentView: View {
    
    @StateObject var viewModel =  ViewModel()
    
    var body: some View {
        Form {
            Section("Selecciona una foto") {
                VStack {
                    ForEach(viewModel.image) {img in
                        img
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120,height: 120)
                        
                    }
                    
                        
                    Divider()
                    PhotosPicker(selection: $viewModel.photoSelection, matching: .any(of: [.videos, .images]), photoLibrary: .shared()) {
                        Label("Selecciona una foto", systemImage: "photo.on.rectangle.angled")
                        
                    }
                    
                    
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
