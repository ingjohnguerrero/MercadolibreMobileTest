//
//  TableViewCellCustomizable.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 9/04/21.
//

import Foundation
import UIKit

/// Protocol describing the basic method a custom cell must have
protocol TableViewCellCustomizable {

    /// Reusable id for the custom cell
    static var cellId: String { get }

    /// Bundle relative to the cell prototype, we are trying to load
    static var bundle: Bundle { get }

    /// Name of the Nib for the cell prototype we are trying to load
    static var nib: UINib { get }

    /// Register a custom cell into the gave
    /// - Parameter tableView: Table view in which we want to register our custom cell
    static func registerCellPrototypes(tableView: UITableView)

    /// Build and return a cell instance in order to display it, in the gaven tableView
    /// - Parameters:
    ///   - tableView: tableView where we want to display the custom cell
    ///   - indexPath: current indexPath in order to get cell prototype that is neaded
    ///   - cellViewModel: Custom cell presenter in order to handle the information
    ///   isolated from the CoreData model
    static func dequeue(
        from tableView: UITableView,
        for indexPath: IndexPath,
        with cellViewModel: CellViewModel
    ) -> UITableViewCell

    
    /// Configure the table view cell with the given cell view model
    /// - Parameter cellViewModel: view model extension to fill the cell with information
    func configure(with cellViewModel: CellViewModel)
}
