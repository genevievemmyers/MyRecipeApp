//
//  Recipe.swift
//  myersG_Final
//
//  Created by Genevieve Myers on 3/8/20.
//  Copyright © 2020 Genevieve Myers. All rights reserved.
//

import Foundation


var recipes : [Recipe] = [
    Recipe( name:"Pasta dough",
            ingredients: [("Flour",1.0, Measure.Cup),("Egg",4.0, Measure.Piece),("Olive Oil",4.0, Measure.Tablespoon), ("Salt", 0.25, Measure.Tablespoon)],
            instructions : ["On a clean workspase place flour in a mound and make a well in center", "Add eggs, olive oil and salt and begin to beat eggs with a spoon slowly encorporting flower into egg mixture", "When eggs become too thick to mix with fork begin kneeding","Kneed for about y minutes until dough is smooth and elastic, will shpring back if indentid with thumb","Cover tightly with plastic and allow to rest at least 1 hour before rolling and cutting"]),
    Recipe( name:"Beef stroganouff",
            ingredients: [("Beef chuck",1.5, Measure.Pound), ("Chicken Stock",4.0, Measure.Cup),("Flour",0.25, Measure.Cup),("White Onion", 1.0, Measure.Piece),("Baby bella mushrooms",16.0, Measure.Ounce),("Butter",3.0, Measure.Tablespoon),("Heavy Cream",0.75, Measure.Cup),("Garlic",9.0, Measure.Piece)],
            instructions : ["Chop onions to a meduium dice, mince garlic and slice mushrooms  1/4inch thickness","Heat a large pot to medum high heat and begin to sautee mushrooms and onion", "Cook onion and mushrooms about 4 minutes untill softened, add garlic and cook untill fragrant", "Stir in flour and butter and sautee untill butter melted and flour begins to take on some color","Add heavy cream and chicken stock and mix to combine", "Reduce heat to low and simmer 20 minutes"]),
    Recipe( name: "Lentil soup",
            ingredients: [("Black lentils",4.0, Measure.Ounce),("Red lentils",4.0, Measure.Ounce),("White lentils",4.0, Measure.Ounce),("Vegtable Stock",4.0, Measure.Quart),("Spanish onion", 1.0, Measure.Piece),("Thyme springs", 2.0, Measure.Piece),("Olive oil", 2.0, Measure.Tablespoon),("Cumin", 0.25, Measure.Teaspoon)],
            instructions : ["In a medium saucepan heat olive oil on medium high heat", "Add onion and cook until nearly sot, about 4 minutes","Add lentis, cumin and any addioional desired seasonings and toast for about two minutes","Add stock and bring to boil, then reduce to simmer and cover"]),
    Recipe( name: "Red Beans",
            ingredients: [("Polish kelbasa",1.5, Measure.Pound), ("Chicken Stock",4.0, Measure.Cup),("Celery",2.0, Measure.Piece),("White Onion", 1.0, Measure.Piece),("Green bell pepper",1.0, Measure.Piece),("Butter",3.0, Measure.Tablespoon),("Kidney beans",1.0, Measure.Pound),("Garlic",9.0, Measure.Piece)],
            instructions : ["Place beans in large pot of cold water and allow to soak over night","Once soaked strain off water and begin prep","Chop onion, clery and bell peper to small dice and finley mince galric", "In a large pot at medium high heat, heat butter","Add trinity of ver and cook till softened","Add garlic and cook until fragerant",]),
    Recipe( name: "Tamales",
            ingredients: [],
            instructions : []),
    Recipe( name: "Lamb Chops",
            ingredients: [],
            instructions : []),
    Recipe( name: "Duck Frites",
            ingredients: [],
            instructions : []),
    Recipe( name: "Plaice",
            ingredients: [],
            instructions : []),
    Recipe( name: "Sourdough Starter",
            ingredients: [],
            instructions : []),
    Recipe( name: "Tomato Soup",
            ingredients: [],
            instructions : []),
    Recipe( name: "Steak Sauce",
            ingredients: [],
            instructions : []),
    Recipe( name: "Black Garlic Ramen",
            ingredients: [],
            instructions : []),
]


enum `Measure` : String, CaseIterable {
    case Cup = "Cup"
    case Gram = "Gram"
    case Ounce = "Ounce"
    case Pint = "Pint"
    case Piece = "Piece"
    case Pound = "Pound"
    case Quart = "Quart"
    case Tablespoon = "Tablespoon"
    case Teaspoon = "Teaspoon"
}

class Recipe {
    var name : String
    var ingredients : [(String, Double, Measure)]
    //var quantity : [Double]
    //var mesurment : [Measure]
    var instructions : [String]
    init(name: String, ingredients: [(String, Double, Measure)], instructions: [String]) {
        self.name = name
        self.ingredients = ingredients
        //self.quantity = quantity
        //self.mesurment = mesurment
        self.instructions = instructions
    }
}
