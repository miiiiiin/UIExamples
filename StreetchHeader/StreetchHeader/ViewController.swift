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
        .dayOfWeek(WeatherDaySlotSection(items: WeatherDaySlot.sample)),
        .timeHorizontal(WeatherTimeSlotSection(items: WeatherTimeSlot.sample))
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
        view.backgroundColor = .white
        collectionView.register(DayOfWeekVerticalContainerCell.self)
        collectionView.register(TimeSlotHorizontalContainerCell.self)
        collectionView.register(SummaryHeaderView.self, kind: UICollectionView.elementKindSectionHeader)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = flowLayout
        collectionView.alwaysBounceVertical = false
        view.addSubview(collectionView)
    }
}


extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = self.sections[indexPath.section]
        
        switch section.identifier {
        case DayOfWeekVerticalContainerCell.identifier:
            guard let cell = collectionView.dequeueReusableCell(DayOfWeekVerticalContainerCell.self, for: indexPath) else { return UICollectionViewCell() }
//            cell.reloadData(items: section.items()) //fixme
            cell.backgroundColor = .clear
            return cell
            
        case TimeSlotHorizontalContainerCell.identifier:
            guard let cell = collectionView.dequeueReusableCell(TimeSlotHorizontalContainerCell.self, for: indexPath) else { return UICollectionViewCell() }
//            cell.reloadData(items: section.items()) //fixme
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
            guard let cell = collectionView.dequeueReusableSupplementaryView(SummaryHeaderView.self, kind: kind, for: indexPath) else { return UICollectionReusableView() }
            cell.cityLabel.text = header.city
            cell.weatherDescLabel.text = header.weatherDesc
            cell.temperatureLabel.text = String(header.temperature)
            return cell
            
        default:
            return UICollectionReusableView()
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let section = self.sections[section]
        switch section.identifier {
        case TimeSlotHorizontalContainerCell.identifier:
            return CGSize(width: collectionView.frame.width, height: 100) // fixme
//            return CGSize(width: collectionView.rowWidth, height: Metrics.HeaderHeight)
        default:
            return .zero
        }
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 700)
    }

}
