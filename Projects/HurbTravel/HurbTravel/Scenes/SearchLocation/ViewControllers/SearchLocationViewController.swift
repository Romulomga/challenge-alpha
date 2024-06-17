//
//  SearchLocationViewController.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit
import SkeletonView

private enum Section {
    case main
}

private struct Item: Hashable {
    
    let title: String
    
    private let identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

private class CollectionViewSkeletonDiffableDataSource<Section: Hashable, Item: Hashable>: UICollectionViewDiffableDataSource<Section, Item>, SkeletonCollectionViewDataSource {

    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return SearchLocationCollectionViewCell.reuseIdentifier
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, prepareCellForSkeleton cell: UICollectionViewCell, at indexPath: IndexPath) {

    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
}

class SearchLocationViewController: UIViewController {
    
    var interactor: SearchLocationLogic?
    var router: (NSObjectProtocol & SearchLocationRouting & SearchLocationDataPassing)?
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil
    weak var delegate: SuggestedResult?
    
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureHierarchy()
        self.configureDataSource()
    }
    
    // MARK: Route to
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
    }
    
    // MARK: Configure Collection View
    
    private func configureHierarchy() {
        
        self.collectionView.collectionViewLayout = self.createLayout()
        
        self.collectionView.register(
            SearchLocationCollectionViewCell.nib,
            forCellWithReuseIdentifier: SearchLocationCollectionViewCell.reuseIdentifier
        )
    }
    
    func createLayout() -> UICollectionViewLayout {
        
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(41))
            let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

            let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(41))
            let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,subitems: [item])
            let sectionLayout: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
            sectionLayout.interGroupSpacing = 0
            sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

            return sectionLayout
        }
        
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    private func configureDataSource() {
        
        self.dataSource = CollectionViewSkeletonDiffableDataSource<Section, Item>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, location: Item) -> UICollectionViewCell? in
            
            guard let cell: SearchLocationCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SearchLocationCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as? SearchLocationCollectionViewCell else { return nil }
            
            cell.location = location.title
        
            return cell
        }
    }
    
    // MARK: Search Term
    
    func searchTerm(_ term: String) {
        
        if self.dataSource.snapshot().itemIdentifiers.count < 1 {
            
            self.collectionView.showAnimatedGradientSkeleton(transition: .none)
        }
        
        self.interactor?.searchTerm(request: SearchLocation.Setup.Request(term: term, limit: 3))
    }
    
    func eraseDataSource() {
        
        var snapshot: NSDiffableDataSourceSnapshot<Section, Item> = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.deleteAllItems()
        
        self.collectionView.hideSkeleton()
        self.dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension SearchLocationViewController: SearchLocationDisplay {
    
    func displayLocations(viewModel: SearchLocation.Setup.ViewModel) {
        
        var snapshot: NSDiffableDataSourceSnapshot<Section, Item> = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(viewModel.locations.compactMap({ Item(title: $0) }), toSection: .main)
        
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func displayHideSkeleton() {
        
        self.collectionView.hideSkeleton()
    }
    
    func displayErrorAlert() {
        
        let alert: UIAlertController = UIAlertController(title: "Erro", message: "Aconteceu um erro inesperado, tente novamente em alguns instantes.", preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension SearchLocationViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let location: Item = self.dataSource.itemIdentifier(for: indexPath) {
            
            self.delegate?.didSelectLocation(location: location.title)
        }
    }
}
