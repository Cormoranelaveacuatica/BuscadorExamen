//
//  FilmViewCell.swift
//  BuscadorExamen
//
//  Created by Mañanas on 17/6/25.
//

import UIKit

class FilmViewCell: UITableViewCell {

    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func render (with film: Film) {
        titleLabel.text = film.Title
        yearLabel.text = film.Year
        posterImageView.loadFrom(url: URL(string: film.Poster)!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
