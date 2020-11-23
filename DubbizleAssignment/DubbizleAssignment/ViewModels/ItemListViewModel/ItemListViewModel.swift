//
//  ItemListViewModel.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation
class ItemListViewModel {
    
    private var httpClient: NetworkClient!
    
    let title = AppText.Items.localized
    var isBusy: Binding<Bool> = Binding(false)
    var itemData: Binding<ItemData?> = Binding(nil)
    var error: Binding<NetworkError?> = Binding(nil)
    var items = [Item]()

    init(client: NetworkClient? = nil) {
        self.httpClient = client ?? NetworkClient.shared
    }
    
    func getItems() { // Get Items list from API
        isBusy.value = true
        httpClient.dataTask(NetworkAPI.getItems) { [weak self] (result) in
            guard let self = self else {
                return
            }
            
            self.isBusy.value = false
            switch result {
            case .success(let data):
                guard let data = data else {
                    return
                }
                do {
                    let itemDataTemp = try JSONDecoder().decode(ItemData.self, from: data)
                    self.itemData.value = itemDataTemp
                    self.items = itemDataTemp.results
                } catch {
                    print("Data could not loaded")
                }
            case .failure(let error):
                self.error.value = NetworkError(error.localizedDescription)
            }
        }
    }
}
