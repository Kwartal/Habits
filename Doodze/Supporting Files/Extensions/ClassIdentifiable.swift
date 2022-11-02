//
//  ClassIdentifiable.swift
//  Doodze
//
//  Created by Богдан Баринов on 02.11.2022.
//

import UIKit

protocol ClassIdentifiable {
    static var reuseId: String { get }
}

extension ClassIdentifiable {
    
    static var reuseId: String {
        return String(describing: self)
    }
    
}

// MARK: - UITableViewCell

extension UITableView {
    
    func register<T: UITableViewCell>(cellType: T.Type) where T: ClassIdentifiable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseId)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseId) as? T
        else { fatalError(dequeueError(reuseId: type.reuseId)) }
        
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self, for indexPath: IndexPath) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseId, for: indexPath) as? T
        else { fatalError(dequeueError(reuseId: type.reuseId)) }
        
        return cell
    }
    
}

// MARK: - UITableViewHeaderFooterView

extension UITableView {
    
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(viewType: T.Type) where T: ClassIdentifiable {
        register(viewType.self, forHeaderFooterViewReuseIdentifier: viewType.reuseId)
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withViewType type: T.Type = T.self) -> T where T: ClassIdentifiable {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: type.reuseId) as? T
        else { fatalError(dequeueError(reuseId: type.reuseId)) }
        
        return view
    }
    
}

// MARK: - Dequeue Error Method

extension UITableView {
    
    private func dequeueError(reuseId: String) -> String {
        return "Couldn't dequeue cell with identifier \(reuseId)"
    }
    
}

// MARK: - UICollectionViewCell

extension UICollectionView {
    
    func register<C: UICollectionViewCell>(cellType: C.Type) where C: ClassIdentifiable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseId)
    }
    
    func dequeueReusableCell<C: UICollectionViewCell>(withCellType type: C.Type = C.self, for indexPath: IndexPath) -> C where C: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.reuseId, for: indexPath) as? C
        else { fatalError(makeItemError(withIdentifier: type.reuseId, type: C.self)) }
        
        return cell
    }
    
}

// MARK: - UICollectionReusableView

extension UICollectionView {
    
    enum SupplymentaryViewKind {
        case header
        case footer
        
        var identifier: String {
            switch self {
            case .header:
                return elementKindSectionHeader
            case .footer:
                return elementKindSectionFooter
            }
        }
    }
    
    func registerView<C: UICollectionReusableView>(ofKind kind: SupplymentaryViewKind, viewType: C.Type) where C: ClassIdentifiable {
        register(viewType.self, forSupplementaryViewOfKind: kind.identifier, withReuseIdentifier: viewType.reuseId)
    }
    
    func dequeueReusableView<C: UICollectionReusableView>(ofKind kind: SupplymentaryViewKind, withViewType type: C.Type = C.self, for indexPath: IndexPath) -> C where C: ClassIdentifiable {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind.identifier, withReuseIdentifier: type.reuseId, for: indexPath) as? C
        else { fatalError(makeItemError(withIdentifier: type.reuseId, type: C.self)) }
        
        return view
    }
    
}

// MARK: - Dequeue Error Method

extension UICollectionView {
    
    private func makeItemError<T>(withIdentifier reuseIdentifier: String, type _: T) -> String {
        return "Couldn't dequeue \(T.self) with identifier \(reuseIdentifier)"
    }
    
}
