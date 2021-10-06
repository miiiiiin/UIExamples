//
//  ViewController.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/08/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var header: WeatherHeader = WeatherHeader(city: "Chicago", weatherDesc: "sunny", temperature: 25)
    
    var sections: [CellType] = [
        .timeHorizontal(WeatherTimeSlotSection(items: WeatherTimeSlot.sample)),
        .dayOfWeek(WeatherDaySlotSection(items: WeatherDaySlot.sample))
    ]

    private lazy var flowLayout: CustomLayout = {
        let layout = CustomLayout()
        layout.scrollDirection = .vertical
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        let cloudLayer = CALayer()
        cloudLayer.fillCloudImage(self.view.bounds)
        self.view.layer.addSublayer(cloudLayer)
        view.backgroundColor = .clear
        collectionView.register(SummaryHeaderView.self, kind: UICollectionView.elementKindSectionHeader)
        collectionView.register(DayOfWeekVerticalContainerCell.self)
        collectionView.register(TimeSlotHorizontalContainerCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = flowLayout
        collectionView.alwaysBounceVertical = false
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let headerHeightMaxChange = Metrics.HorizontalWeatherCellHeight
        var subOffset: CGFloat = 0
        if offsetY > headerHeightMaxChange {
            subOffset = offsetY - headerHeightMaxChange
        } else {
            subOffset = 0
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: NotificationNames.setOffset), object: subOffset)
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = self.sections[indexPath.section]
        print("cellforitemat section: \(section.identifier)")
        switch section.identifier {
        case DayOfWeekVerticalContainerCell.identifier:
            guard let cell = collectionView.dequeueReusableCell(DayOfWeekVerticalContainerCell.self, for: indexPath) else { return UICollectionViewCell() }
            cell.reloadData(items: section.items())
            cell.backgroundColor = .clear
            return cell
            
        case TimeSlotHorizontalContainerCell.identifier:
            guard let cell = collectionView.dequeueReusableCell(TimeSlotHorizontalContainerCell.self, for: indexPath) else { return UICollectionViewCell() }
            cell.reloadData(items: section.items())
            return cell
        default:
            break
        }
//        guard let cell = collectionView.dequeueReusableCell(DayOfWeekVerticalContainerCell.self, for: indexPath) else { return UICollectionViewCell() }
//        cell.reloadData(items: WeatherDay.sample)
//        return cell
        
        return UICollectionViewCell()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sections[section].itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
//            guard let cell = collectionView.dequeueReusableSupplementaryView(
//                SummaryHeaderView.self,
//                kind: kind,
//                for: indexPath
//            ) else { return UICollectionReusableView() }
            
            guard let cell = collectionView.dequeueReusableSupplementaryView(SummaryHeaderView.self, kind: kind, for: indexPath) else { return UICollectionReusableView() }
            print("headercell: \(cell), \(kind), \(cell.cityLabel)")
//            cell.cityLabel.text = header.city
//            cell.weatherDescLabel.text = header.weatherDesc
//            cell.temperatureLabel.text = String(header.temperature)
            return cell
            
        default:
            return UICollectionReusableView()
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let section = self.sections[section]
        switch section.identifier {
        case TimeSlotHorizontalContainerCell.identifier:
            return CGSize(width: collectionView.rowWidth, height: Metrics.HeaderHeight)
        default:
            return .zero
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegateLayoutAttribute {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = self.sections[indexPath.section]
        print("sizeForItemAt: \(section.identifier), \(collectionView.rowWidth)")
        switch section.identifier {
        case DayOfWeekVerticalContainerCell.identifier:
            return CGSize(width: collectionView.rowWidth, height: 700)
            
        case TimeSlotHorizontalContainerCell.identifier:
            return CGSize(width: collectionView.rowWidth, height: Metrics.HorizontalWeatherCellHeight)
        default:
            break
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, forItemAt indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let section = self.sections[indexPath.section]
        print("collectinoview layout foritem: \(UICollectionViewLayoutAttributes(forCellWith: indexPath))")
        switch section.identifier {
        case TimeSlotHorizontalContainerCell.identifier:
            return StickyLayoutAttributes(forCellWith: indexPath)
        default:
            return nil
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, kind: String, forSupplementary indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        print("for supplmentary: \(kind)")
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            return OverlayAlphaLayoutAttributes(forSupplementaryViewOfKind: kind, with: indexPath)
        default:
            return nil
        }
    }
}

struct Metrics {
    static let HeaderHeight: CGFloat = 250
    static let HorizontalWeatherCellHeight: CGFloat = 130
}

struct NotificationNames {
    static let setOffset = "setOffset"
}
