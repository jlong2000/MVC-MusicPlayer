//
//  AppCoordinator.swift
//  Music Player
//
//  Created by Jiang Long on 8/6/21.
//

import UIKit

/// A class to handle the app flow

class AppCoordinator {

  static let shared = AppCoordinator()

  private var navigationController = UINavigationController()

  public func start(on window: UIWindow) {
    let albumListVC = AlbumListViewController(nibName: nil, bundle: nil)
    albumListVC.delegate = self
    navigationController = UINavigationController(rootViewController: albumListVC)
    window.rootViewController = navigationController
  }
}

// MARK: AlbumListViewControllerDelegate

extension AppCoordinator: AlbumListViewControllerDelegate {

  func didSelectAlbum(_ album: Album) {
    let trackListVC = TrackListViewController(for: album)
    trackListVC.delegate = self
    navigationController.pushViewController(trackListVC, animated: true)
  }

}

// MARK: TrackListViewControllerDelegate

extension AppCoordinator: TrackListViewControllerDelegate {

  func didSelectTrack(for album: Album, track: Track) {

  }

}
