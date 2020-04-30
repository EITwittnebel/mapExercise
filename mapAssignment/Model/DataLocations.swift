//
//  DataLocations.swift
//  mapAssignment
//
//  Created by Field Employee on 4/29/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

import Foundation

let locations: [InterestingLocation] = [bigBen, saintMarks, eiffelTower]

let bigBen: InterestingLocation = InterestingLocation(name: NSLocalizedString("Big Ben", comment: "Big Ben"), desc: NSLocalizedString("""
Big Ben is the nickname for the Great Bell of the striking clock at the north end of the Palace of Westminster in London and is usually extended to refer to both the clock and the clock tower.
""", comment: "big ben desc")
, photoName: "bigben.jpg", coordLat: 51.5007, coordLong: 0.1246)

let saintMarks: InterestingLocation = InterestingLocation(name: NSLocalizedString("St Mark's Basilica", comment: "Saint Mark's name"), desc: NSLocalizedString("The Patriarchal Cathedral Basilica of Saint Mark, commonly known as St Mark's Basilica, is the cathedral church of the Roman Catholic Archdiocese of Venice, northern Italy. It is the most famous of the city's churches and one of the best known examples of Italo-Byzantine architecture.", comment: "Saint Mark's Description"), photoName: "saintmarks.jpg", coordLat: 45.4346, coordLong: 12.3397)


let eiffelTower: InterestingLocation = InterestingLocation(name: NSLocalizedString("Eiffel Tower", comment: "Eiffel Tower name"), desc: NSLocalizedString("The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower.", comment: "Eiffel Tower description"), photoName: "eiffel.jpg", coordLat: 48.8584, coordLong: 2.2945)

