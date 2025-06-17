//
//  DetailFilmViewController.swift
//  BuscadorExamen
//
//  Created by Mañanas on 17/6/25.
//

import UIKit

class DetailFilmViewController: UIViewController {
    
    @IBOutlet var sinopsisLabel: UITextView!
    @IBOutlet var paisLabel: UILabel!
    @IBOutlet var generoLabel: UILabel!
    @IBOutlet var añoLabel: UILabel!
    @IBOutlet var duracionLable: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    var film: Film!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let id = film.imdbID
        searchFilm (query: id)

        // Do any additional setup after loading the view.
    }
    func render (with film: Film) {
        sinopsisLabel.text = film.Plot
        paisLabel.text = film.Country
        generoLabel.text = film.Genre
        añoLabel.text = film.Year
        duracionLable.text = film.Runtime
        directorLabel.text = film.Director
        titleLabel.text = film.Title
        posterImageView.loadFrom(url: URL(string: film.Poster)!)
    }
    
    func searchFilm(query: String) {
        Task {
            let result = try await FilmProvider.findFilmByID(query: query)
            film = result
            
            DispatchQueue.main.async {
                self.render(with: self.film)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
