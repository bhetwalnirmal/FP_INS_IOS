//
//  ViewController.swift
//  FP_INS_IOS
//
//  Created by nirmal on 2022-05-17.
//

import UIKit

class ViewController: UIViewController {
    var floatingActionButton: UIButton!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var locationCollectionView: UICollectionView!
    var filteredLocations: [Location] = [Location]()
    var currentSelectedLocation: Location? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting data source and delegate of location collection view
        locationCollectionView.dataSource = self
        locationCollectionView.delegate = self
        filteredLocations = locations
        // setting viewlaylout of location collection view
        locationCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        // initialize the floating action button
        self.floatingActionButton = UIButton(type: .custom)
        // setting up the target of the floating button
        self.floatingActionButton.addTarget(self, action: #selector(self.addDataFloatingActionButton(_:)), for: UIControl.Event.touchUpInside)
        // adding the floatingactionbutton as a subview in the view
        self.view.addSubview(self.floatingActionButton)
        searchBar.delegate = self
        self.definesPresentationContext = false
    }

    @objc func addDataFloatingActionButton (_ sender: UIButton) {
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // setting the corner radius to make the button round
        floatingActionButton.layer.cornerRadius = 30
        // setting the color of the button to red
        floatingActionButton.backgroundColor = UIColor.red
        floatingActionButton.clipsToBounds = true
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 30.0, weight: .regular, scale: .medium)
        // using system image for the plus icon
        let symbol = UIImage(systemName: "plus", withConfiguration: symbolConfig)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        // setting the symbol as the image of the floating action button
        floatingActionButton.setImage(symbol, for: .normal)
        floatingActionButton.translatesAutoresizingMaskIntoConstraints = false
        // adding constraints to place the floating action button to the bottom of the screen
        NSLayoutConstraint.activate([
            floatingActionButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            floatingActionButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            floatingActionButton.widthAnchor.constraint(equalToConstant: 60),
            floatingActionButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func navigateToLocationScreen(){
        performSegue(withIdentifier: "navigateToLocationScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _=segue.destination as! LocationScreenViewController
        guard let secondViewController = segue.destination as? LocationScreenViewController else { return }
               // Pass Data to Second View Controller
        secondViewController.locationData = currentSelectedLocation
    
        
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredLocations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationCollectionViewCell", for: indexPath) as! LocationCollectionViewCell
        cell.setup(with: filteredLocations[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 300)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(locations[indexPath.row].locationTitle)
        currentSelectedLocation = locations[indexPath.row]
        // todo: Open Individual Location Tab
        
        navigateToLocationScreen();
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text != "" {
            filteredLocations = locations.filter {
                return $0.getTitle().range(of: "\(searchText).*", options: [.regularExpression, .caseInsensitive]) != nil
            }
        } else {
            filteredLocations = locations
        }
        
        self.locationCollectionView.reloadData()
    }
}
