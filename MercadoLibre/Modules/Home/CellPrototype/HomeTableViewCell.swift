//
//  HomeTableViewCell.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 9/04/21.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {

    // MARK: - IBOutlets -

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - View LifeCycle -

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with cellViewModel: CellViewModel) {
        guard let productCellViewModel = cellViewModel as? ProductCellViewModel else {
            return
        }
        titleLabel.text = productCellViewModel.title
        updateThumbnailImage(urlString: productCellViewModel.thumbnailUrl)
    }

    /// Set cell's image thumbnail
    /// - Parameter urlString: url to image
    func updateThumbnailImage(urlString: String) {
        let url = URL(string: urlString)
        let placeholderImage = #imageLiteral(resourceName: "placeHolder")
        thumbnailImageView.kf.setImage(
            with: url,
            placeholder: placeholderImage,
            options: [
                .loadDiskFileSynchronously,
                .cacheOriginalImage,
                .transition(.fade(0.25))
            ]
        )
    }

}

extension HomeTableViewCell: TableViewCellCustomizable {

    static var cellId: String {
        return "HomeViewCell"
    }

    static var bundle: Bundle {
        return Bundle(for: HomeTableViewCell.self)
    }

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: HomeTableViewCell.bundle)
    }

    static func registerCellPrototypes(tableView: UITableView) {
        tableView.register(HomeTableViewCell.nib, forCellReuseIdentifier: HomeTableViewCell.cellId)
    }

    static func dequeue(
        from tableView: UITableView,
        for indexPath: IndexPath,
        with cellViewModel: CellViewModel
    ) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: HomeTableViewCell.cellId,
                    for: indexPath
                ) as? HomeTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(with: cellViewModel)

        return cell
    }

}
