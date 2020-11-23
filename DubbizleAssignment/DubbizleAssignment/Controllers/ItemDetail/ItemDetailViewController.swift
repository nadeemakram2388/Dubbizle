//
//  ItemDetailViewController.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/23/20.
//

import UIKit

typealias ItemDetailViewControllerNavigateToPhotoHandler = (_ photo: String) -> ()

class ItemDetailViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    let itemViewModel: ItemViewModel
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemTimeLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!

    var navigateToPhotoHandler: ItemDetailViewControllerNavigateToPhotoHandler?
    var currentPhotoViewController: PhotoViewController? {
        return pageViewController.viewControllers?.first as? PhotoViewController
    }
    var currentPhoto: String? {
        return currentPhotoViewController?.photo
    }
    
    var maximumZoomScale: CGFloat = 1.0 {
        didSet {
            self.currentPhotoViewController?.scalingImageView.maximumZoomScale = maximumZoomScale
        }
    }
    
    var pageViewController: UIPageViewController!
    var dataSource: PhotosDataSource
    var shouldHandleLongPressGesture = true//false
            
    // MARK: - Initialization
    
    deinit {
        pageViewController.delegate = nil
        pageViewController.dataSource = nil
    }
    
    init?(coder aDecoder: NSCoder, item: Item) {
        self.itemViewModel = ItemViewModel(item: item)
        dataSource = PhotosDataSource(photos: item.image_urls)
        super.init(coder: aDecoder)
        setupPageViewControllerWithInitialPhoto(item.image_urls.first)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupPageViewControllerWithInitialPhoto(_ initialPhoto: String? = nil) {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: [UIPageViewController.OptionsKey.interPageSpacing: 16.0])
        pageViewController.view.backgroundColor = UIColor.clear
        pageViewController.delegate = self
        pageViewController.dataSource = self

        if let photo = initialPhoto , dataSource.contaPhoto(photo) {
            changeToPhoto(photo, animated: false)
        } else if let photo = dataSource.photos.first {
            changeToPhoto(photo, animated: false)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.tintColor = UIColor.white
        view.backgroundColor = UIColor.white
        pageViewController.view.backgroundColor = UIColor.clear
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pageViewController.didMove(toParent: self)
        self.setupUI()
    }
    
    private func setupUI() {
        itemNameLabel.text = self.itemViewModel.name
        itemTimeLabel.text = self.itemViewModel.postedOn
    }

    // MARK: - Public
    
    //Displays the specified photo. Can be called before the view controller is displayed. Calling with a photo not contained within the data source has no effect.
    func changeToPhoto(_ photo: String, animated: Bool, direction: UIPageViewController.NavigationDirection = .forward) {
        if !dataSource.contaPhoto(photo) {
            return
        }
        let photoViewController = initializePhotoViewControllerForPhoto(photo)
        pageViewController.setViewControllers([photoViewController], direction: direction, animated: animated, completion: nil)
    }

    func initializePhotoViewControllerForPhoto(_ photo: String) -> PhotoViewController {
        let photoViewController = PhotoViewController(photo: photo)
        photoViewController.scalingImageView.maximumZoomScale = self.maximumZoomScale
        return photoViewController
    }
        
    //PageViewController
    @objc open func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let photoViewController = viewController as? PhotoViewController,
            let photoIndex = dataSource.indexOfPhoto(photoViewController.photo),
            let newPhoto = dataSource[photoIndex-1] else {
                return nil
        }
        return initializePhotoViewControllerForPhoto(newPhoto)
    }
    
    @objc open func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let photoViewController = viewController as? PhotoViewController,
            let photoIndex = dataSource.indexOfPhoto(photoViewController.photo),
            let newPhoto = dataSource[photoIndex+1] else {
                return nil
        }
        return initializePhotoViewControllerForPhoto(newPhoto)
    }
    
    @objc open func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let currentPhotoViewController = currentPhotoViewController {
                navigateToPhotoHandler?(currentPhotoViewController.photo)
            }
        }
    }
}
