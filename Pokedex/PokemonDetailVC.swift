//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by LionMane Software on 2/20/17.
//  Copyright © 2017 LionMane Software. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized
        mainImg.image = UIImage(named: "\(pokemon.pokedexId)")
        currentEvoImg.image = UIImage(named: "\(pokemon.pokedexId)")
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetail {
            print("Termino la descarga")
            self.updateUI()
        }
    }

    @IBAction func backBtnPress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateUI(){
        
        defenseLbl.text = pokemon.defense
        attackLbl.text = pokemon.attack
        weightLbl.text = pokemon.weight
        heightLbl.text = pokemon.height
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
             evoLbl.text = "No evolutions"
            nextEvoImg.isHidden = true
        }else{
             evoLbl.text = "Next Evolution: \(pokemon.nextEvolutionName.capitalized) - Lvl \(pokemon.nextEvolutionLevel)"
            
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: "\(pokemon.nextEvolutionId)")

        }
        
       
        
        
    }
}
