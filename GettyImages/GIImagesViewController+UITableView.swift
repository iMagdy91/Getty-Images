//
//  GIImagesViewController+UITableView.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/17/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit

extension GIImagesViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Cell Construction Methods
    func constructNormalCellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> GIGettyTableViewCell {
        let cell: GIGettyTableViewCell?  = tableView.dequeueReusableCell(withIdentifier: UITableViewCellIdentifier.gettyCellIdentifier) as? GIGettyTableViewCell
        return cell!
    }
    
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return constructNormalCellForTableView(tableView:tableView,  atIndexPath:indexPath)
    }
    
    // MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
