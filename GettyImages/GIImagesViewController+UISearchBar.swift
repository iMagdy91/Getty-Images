//
//  GIImagesViewController+UISearchBar.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/17/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit

extension GIImagesViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    // MARK: - UISearchBarDelegate Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchController.searchBar.text != "" {
            searchText = searchController.searchBar.text
        }
    }
    
    // MARK: - UISearchControllerDelegate Methods
    func didDismissSearchController(_ searchController: UISearchController) {
        searchText = nil
    }
    
    
}
