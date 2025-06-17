//
//  ViewController.swift
//  BuscadorExamen
//
//  Created by Mañanas on 17/6/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet var tableView: UITableView!
    var film: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        searchFilm(query: "Star Wars")
    }
    func searchFilm(query: String) {
        Task {
            let result = try await FilmProvider.findFilmsByName(query: query)
            film = result
            tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchFilm(query: searchBar.text!)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        film.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmViewCell", for: indexPath) as! FilmViewCell
        let film = film [indexPath.row]
        cell.render(with: film)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailFilmViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            detailViewController.film = film[selectedIndexPath.row]
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
        
    }
    
    


}

