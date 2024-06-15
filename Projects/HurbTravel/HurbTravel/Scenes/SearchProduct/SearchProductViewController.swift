//
//  SearchProductViewController.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit
import HUGraphQL
import SkeletonView

protocol SearchProductDisplayLogic: AnyObject {
    
    func displayNewProducts(viewModel: SearchProduct.Query.ViewModel)
    func displayNoSearchResultsView()
    func displayErrorAlert()
    
    func displayProductDetails()
}

private struct Section: Identifiable {

    enum Identifier: String, CaseIterable {

        case empty = "Empty"
        case noSearchResults = "NoSearchResults"
        case results = "Results"
    }
    
    var id: Identifier
}

private struct Item: Identifiable {
    
    var id: UUID
    var item: AnyHashable
}

private class CollectionViewSkeletonDiffableDataSource<Section: Hashable, Item: Hashable>: UICollectionViewDiffableDataSource<Section, Item>, SkeletonCollectionViewDataSource {

    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return ProductsCollectionViewCell.cellIdentifier
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, prepareCellForSkeleton cell: UICollectionViewCell, at indexPath: IndexPath) {

    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
}

class SearchProductViewController: UIViewController {
    
    var interactor: SearchProductBusinessLogic?
    var router: (NSObjectProtocol & SearchProductRoutingLogic & SearchProductDataPassing)?
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<Section.ID, Item.ID>! = nil
    private lazy var itemsStore: IdentifiableModelStore<Item> = IdentifiableModelStore([])
    
    private var searchController: UISearchController?
    private lazy var location: String = "Rio de janeiro"
    private lazy var page: Int = 1
    private lazy var limit: Int = 15
    private lazy var hasNext: Bool = false
    private lazy var searchTimer: Timer = Timer()

    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSearchController()
        self.configureHierarchy()
        self.configureDataSource()
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        self.router?.routeTo(segue: segue, sender: sender)
    }
    
    private func setupSearchController() {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "SearchLocation", bundle: nil)
        let searchLocationViewController: SearchLocationViewController? = storyboard.instantiateViewController(withIdentifier: "SearchLocationViewController") as? SearchLocationViewController
        searchLocationViewController?.delegate = self
        SearchLocationConfigurator.setupArch(viewController: searchLocationViewController!)
        
        self.searchController = UISearchController(searchResultsController: searchLocationViewController)
        self.searchController?.searchBar.searchTextField.placeholder = "Vai pra onde?"
        self.searchController?.searchBar.delegate = self
        self.searchController?.searchBar.setValue("Cancelar", forKey: "cancelButtonText")

        self.navigationItem.searchController = self.searchController
        self.definesPresentationContext = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // MARK: Configure Collection View

    private func configureHierarchy() {
        
        self.collectionView.collectionViewLayout = self.createLayout()
        
        self.collectionView.register(
            ProductsCollectionViewCell.nib,
            forCellWithReuseIdentifier: ProductsCollectionViewCell.cellIdentifier
        )
        
        self.collectionView.register(
            EmptyProductsCollectionViewCell.nib,
            forCellWithReuseIdentifier: EmptyProductsCollectionViewCell.cellIdentifier
        )
        
        self.collectionView.register(
            NoSearchResultsCollectionViewCell.nib,
            forCellWithReuseIdentifier: NoSearchResultsCollectionViewCell.cellIdentifier
        )
    }
    
    func createLayout() -> UICollectionViewLayout {
        
        let sectionProvider: (Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(334))
            let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

            let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(334))
            let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,subitems: [item])
            let sectionLayout: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
            sectionLayout.interGroupSpacing = 0
            sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

            return sectionLayout
        }
        
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    private func configureDataSource() {
        
        self.dataSource = CollectionViewSkeletonDiffableDataSource<Section.ID, Item.ID>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, id: Item.ID) -> UICollectionViewCell? in
            
            let item: AnyHashable = self.itemsStore.fetchByID(id).item
            
            if let product: Product = item as? Product {
                
                guard let cell: ProductsCollectionViewCell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ProductsCollectionViewCell.cellIdentifier,
                    for: indexPath
                ) as? ProductsCollectionViewCell else { return nil }
                
                cell.product = product
            
                return cell
            }
            
            if let section: Section.Identifier = item as? Section.Identifier, section == .empty {
                
                guard let cell: EmptyProductsCollectionViewCell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: EmptyProductsCollectionViewCell.cellIdentifier,
                    for: indexPath
                ) as? EmptyProductsCollectionViewCell else { return nil }
                            
                return cell
            }
            
            if let section: Section.Identifier = item as? Section.Identifier, section == .noSearchResults {
                
                guard let cell: NoSearchResultsCollectionViewCell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: NoSearchResultsCollectionViewCell.cellIdentifier,
                    for: indexPath
                ) as? NoSearchResultsCollectionViewCell else { return nil }
                            
                return cell
            }
            
            return nil
        }
        
        var snapshot: NSDiffableDataSourceSnapshot<Section.ID, Item.ID> = NSDiffableDataSourceSnapshot<Section.ID, Item.ID>()
        snapshot.appendSections([Section.Identifier.empty])

        let item: Item = Item(id: UUID(), item: Section.Identifier.empty)
        self.itemsStore.append([item])

        snapshot.appendItems([item.id], toSection: .empty)

        self.dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    // MARK: IBActions
    
    @IBAction private func didFireTimerForAddress(_ timer: Timer) {
        
        if let resultsController: SearchLocationViewController = self.searchController?.searchResultsController as? SearchLocationViewController {
            
            resultsController.searchTerm((self.searchController?.searchBar.text)!)
        }
    }
}

extension SearchProductViewController: SearchProductDisplayLogic {

    func displayNewProducts(viewModel: SearchProduct.Query.ViewModel) {
        
        self.hasNext = viewModel.pagination?.hasNext ?? false
        
        var snapshot: NSDiffableDataSourceSnapshot<Section.ID, Item.ID> = self.dataSource.snapshot()
        let itens: [Item] = viewModel.products.compactMap({ Item(id: UUID(), item: $0) })
        self.itemsStore.append(itens)

        if snapshot.indexOfSection(.results) == nil {
            
            snapshot.deleteAllItems()
            snapshot.appendSections([.results])
        }
        
        snapshot.appendItems(itens.compactMap({ $0.id }), toSection: .results)

        self.collectionView.hideSkeleton()
        self.dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func displayNoSearchResultsView() {
        
        var snapshot: NSDiffableDataSourceSnapshot<Section.ID, Item.ID> = NSDiffableDataSourceSnapshot<Section.ID, Item.ID>()

        if snapshot.indexOfSection(.noSearchResults) == nil {
            
            snapshot.deleteAllItems()
            snapshot.appendSections([Section.Identifier.noSearchResults])
        }
        
        let item: Item = Item(id: UUID(), item: Section.Identifier.noSearchResults)
        self.itemsStore.append([item])
        
        snapshot.appendItems([item.id], toSection: .noSearchResults)

        self.collectionView.hideSkeleton()
        self.dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func displayErrorAlert() {
        
        let alert: UIAlertController = UIAlertController(title: "Erro", message: "Aconteceu um erro inesperado, tente novamente em alguns instantes.", preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayProductDetails() {
        
        self.router?.navigateToDetails()
    }
}

extension SearchProductViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.row > (self.page * self.limit) - 10 && self.hasNext && self.dataSource.snapshot().sectionIdentifiers.count > 0 {
            
            let section: Section.ID = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            
            if section == .results {
                
                self.page += 1
                self.hasNext = false
                let request: SearchProduct.Query.Request = SearchProduct.Query.Request(term: self.location, page: self.page, limit: self.limit)
                self.interactor?.searchProducts(request: request)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let itemId: Item.ID = self.dataSource.itemIdentifier(for: indexPath) else { return }
        let item: AnyHashable = self.itemsStore.fetchByID(itemId).item
        
        if let product: Product = item as? Product {
            
            self.interactor?.didSeletedProduct(request: SearchProduct.Selection.Request(product: product))
        }
    }
}

extension SearchProductViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchTimer.invalidate()

        let trimmedString: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        if trimmedString.count >= 3 {
            
            self.searchTimer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(didFireTimerForAddress(_:)),
                userInfo: nil,
                repeats: false
            )
        } else {
            
            if let resultsController: SearchLocationViewController = self.searchController?.searchResultsController as? SearchLocationViewController {
                
                resultsController.eraseDataSource()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // User tapped the Done button in the keyboard.
        self.searchController?.searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        var snapshot: NSDiffableDataSourceSnapshot<Section.ID, Item.ID> = NSDiffableDataSourceSnapshot<Section.ID, Item.ID>()
        snapshot.appendSections([Section.Identifier.empty])

        let item: Item = Item(id: UUID(), item: Section.Identifier.empty)
        self.itemsStore.append([item])

        snapshot.appendItems([item.id], toSection: .empty)

        self.dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension SearchProductViewController: SuggestedSearch {
    
    func didSelectLocation(location: String) {
        
        var snapshot: NSDiffableDataSourceSnapshot<Section.ID, Item.ID> = NSDiffableDataSourceSnapshot<Section.ID, Item.ID>()
        snapshot.deleteAllItems()

        self.dataSource.apply(snapshot, animatingDifferences: false)
        
        self.searchController?.searchBar.text = location
        self.searchController?.dismiss(animated: true, completion: {
            
            self.location = location
            self.page = 1
            self.hasNext = false
            
            self.collectionView.showAnimatedGradientSkeleton(transition: .none)
            let request: SearchProduct.Query.Request = SearchProduct.Query.Request(term: self.location, page: self.page, limit: self.limit)
            self.interactor?.searchProducts(request: request)
        })
    }
}

