//
//  ImagesViewController.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/15/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit

class GIImagesViewController: GIBaseViewController {

    // MARK: - Properties
    private  let imageStore         : GIImageStore = GIImageStore()
    private  var imagesArrayValue   : [GIImageViewModel]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    internal var imagesArray        : [GIImageViewModel]? {
        set {
            if newValue == nil {
                imagesArrayValue = nil
                imagesSearchResults = nil
                return
            }
            
            if searchController.isActive {
                setCurrentArray(array: &imagesSearchResults, withValue: newValue)
            }
            else {
                setCurrentArray(array: &imagesArrayValue, withValue: newValue)
            }
        }
        get {
            return imagesArrayValue
        }
    }
    
    internal var imagesSearchResults: [GIImageViewModel]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    internal var searchController   : UISearchController = UISearchController(searchResultsController: nil)
    internal var currentPage        : Int = 1 {
        didSet {
            loadDataWithSearchText(searchText: nil)
        }
    }
    
    internal var searchText         : String? {
        didSet {
            imagesArrayValue    = nil
            imagesSearchResults = nil
            currentPage         = 1
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var tableView    : UITableView!
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadDataWithSearchText(searchText: nil)
    }


    //MARK:- Private Methods
    private func setupView() {
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = UITableViewConstants.estimatedRowHeight
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.delegate = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    private func setCurrentArray(array: inout [GIImageViewModel]?,
                                 withValue newValue: [GIImageViewModel]?) {
        guard let images = array else {
            array = newValue
            return
        }
        if images.count > 0 {
            if let value = newValue {
                array! += value
            }
        }

    }
    
    private func loadDataWithSearchText(searchText: String?) {

        imageStore.getDataForAPI(.gettyImage, page: currentPage, searchPhrase: searchText, success: {[weak self] (modelArray) in
            guard let strongSelf = self else { return }
            strongSelf.imagesArray = modelArray as? [GIImageViewModel]
        }) {[weak self] (error) in
            guard let strongSelf = self else { return }
            strongSelf.handleError(error: error)
        }
        
        imageStore.getDataForAPI(.shutterstock, page: currentPage, searchPhrase: searchText, success: {[weak self] (modelArray) in
            guard let strongSelf = self else { return }
            strongSelf.imagesArray = modelArray as? [GIImageViewModel]

        }) { [weak self](error) in
            guard let strongSelf = self else { return }
            strongSelf.handleError(error: error)

        }
        
    }
    
}
