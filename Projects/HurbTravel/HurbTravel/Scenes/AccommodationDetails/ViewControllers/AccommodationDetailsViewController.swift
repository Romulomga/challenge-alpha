//
//  AccommodationDetailsViewController.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 12/06/24.
//

import UIKit
import Kingfisher

class AccommodationDetailsViewController: UIViewController {
    
    var interactor: AccommodationDetailsBusinessLogic?
    var router: (NSObjectProtocol & AccommodationDetailsRoutingLogic & AccommodationDetailsDataPassing)?
    
    // MARK: Outlets

    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var topPriceLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var bottomPriceLabel: UILabel!
    @IBOutlet private weak var firstAmenityView: UIView!
    @IBOutlet private weak var firstAmenityLabel: UILabel!
    @IBOutlet private weak var secondAmenityView: UIView!
    @IBOutlet private weak var secondAmenityLabel: UILabel!
    @IBOutlet private weak var descriptionTitleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLayout()
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        self.router?.routeTo(segue: segue, sender: sender)
    }
    
    // MARK: Setup Layout
    
    private func setupLayout() {
     
        self.navigationItem.largeTitleDisplayMode = .never
        self.interactor?.setupView()
    }
    
    // MARK: IBActions
    
    @IBAction private func share(_ button: UIBarButtonItem) {

        self.interactor?.shareProduct()
    }
}

extension AccommodationDetailsViewController: AccommodationDetailsDisplayLogic {
    
    func displaySetupView(viewModel: AccommodationDetails.Setup.ViewModel) {
        
        self.photoImageView.loadPhoto(url: viewModel.product.medias.first?.url)
        
        self.nameLabel.text = "\(viewModel.product.name) - \(viewModel.product.category.rawValue ?? "")"
        self.addressLabel.text = viewModel.product.getFormattedAddress()
        self.topPriceLabel.text = viewModel.product.getPriceTopText()
        self.priceLabel.text = viewModel.product.getFormattedPrice()
        self.bottomPriceLabel.text = viewModel.product.getPriceBottomText()
        self.descriptionTitleLabel.text = viewModel.descriptionTitle
        self.descriptionLabel.text = viewModel.product.description.readHtml
        
        if let firstAmenity: Amenity = viewModel.product.amenities.first {
            
            self.firstAmenityView.isHidden = false
            self.firstAmenityLabel.text = firstAmenity.name
        }
        
        if let secondAmenity: Amenity = viewModel.product.amenities.last {
            
            self.secondAmenityView.isHidden = false
            self.secondAmenityLabel.text = secondAmenity.name
        }
    }
    
    func displayShareProduct(viewModel: AccommodationDetails.Share.ViewModel) {
        
        let activityViewController: UIActivityViewController = UIActivityViewController(
            activityItems: [viewModel.sharedText],
            applicationActivities: nil
        )
        
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(
            activityViewController,
            animated: true,
            completion: nil
        )
    }
}
