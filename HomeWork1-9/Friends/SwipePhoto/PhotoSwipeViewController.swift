//
//  PhotoSwipeViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 27.04.22.
//

import UIKit

class PhotoSwipeViewController: UIViewController {
    
    var photos: [Photo] = []
    
    var currentPhotoIndex: Int?
    
    var nextPhotoIndex: Int? {
        guard let index = currentPhotoIndex else {
            return nil
        }
        
        let nextIndex = index + 1
        return nextIndex < photos.count ? nextIndex : nil
    }
    
    var previousPhotoIndex: Int? {
        guard let index = currentPhotoIndex else {
            return nil
        }
        
        let prevIndex = index - 1
        return prevIndex > -1 ? prevIndex : nil
    }
    
    var currentPhoto: Photo? {
        guard let index = currentPhotoIndex else {
            return nil
        }
        
        return photos[index]
    }
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var nextImageView: UIImageView!
    
    var currentImageView: UIImageView? {
        [firstImageView, nextImageView].first(where: { !$0.isHidden })
    }
    
    var hiddenImageView: UIImageView? {
        [firstImageView, nextImageView].first(where: { $0.isHidden })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        currentPhotoIndex = photos.isEmpty ? nil : 0
        
        firstImageView.frame = view.bounds
        firstImageView.image = UIImage(named: currentPhoto?.namePhoto ?? "")
        
        nextImageView.frame = view.bounds
        nextImageView.isHidden = true
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipe(_:)))
        leftSwipe.direction = .left
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipe(_:)))
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func viewDidSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case.right:
            swipeToRight()
        case.left:
            swipeToLeft()
        default:
            break
        }
    }
  
    
    func swipeToLeft() {
        guard let nextPhotoIndex = nextPhotoIndex else {
            return
        }
        
        let hiddenImageView = hiddenImageView
        let currentImageView = currentImageView
        
        hiddenImageView?.image = UIImage(named: photos[nextPhotoIndex].namePhoto)
        hiddenImageView?.frame.origin.x = view.bounds.maxX
        hiddenImageView?.isHidden = false
        
        UIView.animateKeyframes(
            withDuration: 0.9,
            delay: 0,
            options: [],
            animations: {
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.25,
                    animations: {
                        currentImageView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    })
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.25,
                    relativeDuration: 0.75,
                    animations: {
                        hiddenImageView?.frame.origin.x = 0
                        currentImageView?.frame.origin.x = -self.view.bounds.width
                    })
                
            },
            completion: { _ in
                self.currentPhotoIndex = nextPhotoIndex
                currentImageView?.isHidden = true
                currentImageView?.transform = .identity
            })
    }
    
    func swipeToRight() {
        guard let previousPhotoIndex = previousPhotoIndex else {
            return
        }
        
        let hiddenImageView = hiddenImageView
        let currentImageView = currentImageView
        
        hiddenImageView?.image = UIImage(named: photos[previousPhotoIndex].namePhoto)
        hiddenImageView?.frame.origin.x = -view.bounds.width
        hiddenImageView?.isHidden = false
        
        UIView.animateKeyframes(
            withDuration: 0.9,
            delay: 0,
            options: [],
            animations: {
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.25,
                    animations: {
                        currentImageView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    })
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.25,
                    relativeDuration: 0.75,
                    animations: {
                        hiddenImageView?.frame.origin.x = 0
                        currentImageView?.frame.origin.x = self.view.bounds.width
                    })
                
            },
            completion: { _ in
                self.currentPhotoIndex = previousPhotoIndex
                currentImageView?.isHidden = true
                currentImageView?.transform = .identity
            })
    }
}
