//
//  ImageViewController.swift
//  Cassini
//
//  Created by siwook on 2017. 10. 14..
//  Copyright © 2017년 siwook. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

  var imageURL: URL? {
    didSet {
      image = nil
      if view.window != nil {
        fetchImage()
      }
    }
  }
  private var imageView = UIImageView()
  private var image: UIImage? {
    get {
      return imageView.image
    }
    set {
      imageView.image = newValue
      imageView.sizeToFit()
    }
  }
  private func fetchImage() {
    if let url = imageURL {
      if let urlContents = try? Data(contentsOf: url) {
        image = UIImage(data: urlContents)
      }
    }
  }


  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(imageView)
    imageURL = DemoURL.stanford
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if image == nil {
      fetchImage()
    }
  }
}
