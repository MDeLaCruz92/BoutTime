//
//  HistoricalManager.swift
//  Bout Time
//
//  Created by Michael De La Cruz on 9/13/16.
//  Copyright © 2016 Michael De La Cruz. All rights reserved.
//

import Foundation
import GameplayKit

class HistoricalManager: Equatable, CustomStringConvertible {
    let event: String
    let date: Int
    
    var description: String {
        return "\(event)"
    }
    
    init(event: String, date: Int) {
        self.event = event
        self.date = date
    }
    
}


func == (lhs: HistoricalManager, rhs: HistoricalManager) -> Bool {
    return lhs.date == rhs.date && lhs.event == rhs.event
}

// Data Storage
let VGFact1 = HistoricalManager(event: "Spacewar! The first computer-based video game", date: 1962)
let VGFact2 = HistoricalManager(event: "Brown Box, the video game protoype is invented", date: 1967)
let VGFact3 = HistoricalManager(event: "Odyssey, the first home video game system is invented", date: 1968)
let VGFact4 = HistoricalManager(event: "Pong, an arcade legend, is born", date: 1972)
let VGFact5 = HistoricalManager(event: "Maze Wars introduces the first-person shooter", date: 1974)
let VGFact6 = HistoricalManager(event: "Atari releases the Video Computer System", date: 1977)
let VGFact7 = HistoricalManager(event: "Pac-Man, an arcade legend, is born", date: 1980)
let VGFact8 = HistoricalManager(event: "Donkey Kong, an arcade game is released by Nitendo", date: 1981)
let VGFact9 = HistoricalManager(event: "Tetris, a masterpiece, is born", date: 1982)
let VGFact10 = HistoricalManager(event: "Nitendo (NES) is invented", date: 1985)
let VGFact11 = HistoricalManager(event: "Shigeru Miyamoto creates The Legend of Zelda", date: 1987)
let VGFact12 = HistoricalManager(event: "John Madden Football is created", date: 1988)
let VGFact13 = HistoricalManager(event: "Nitendo's Game Boy popularizes handheld gaming", date: 1989)
let VGFact14 = HistoricalManager(event: "Solitaire becomes one of the most popular games ever", date: 1990)
let VGFact15 = HistoricalManager(event: "Sonic the Hedgehog, Sega iconic hero is created", date: 1991)
let VGFact16 = HistoricalManager(event: "Mortal Kombat prompts United States hearings on video game violence", date: 1993)
let VGFact17 = HistoricalManager(event: "Blizzard releases WarCraft: Orcs and Humans, a masterpiece game", date: 1994)
let VGFact18 = HistoricalManager(event: "Sony releases PlayStation in the United States, a masterpiece indeed", date: 1995)
let VGFact19 = HistoricalManager(event: "Pokémon Red and Blue is released, and changes the world of gaming!", date: 1996)
let VGFact20 = HistoricalManager(event: "EverQuest, the multiplayer game is released", date: 1999)
let VGFact21 = HistoricalManager(event: "The Sims becomes the best-selling computer game ever", date: 2000)
let VGFact22 = HistoricalManager(event: "Microsoft enters the video game market with Xbox", date: 2001)
let VGFact23 = HistoricalManager(event: "Steam, the digital distribution platform is released", date: 2003)
let VGFact24 = HistoricalManager(event: "Nitendo releases the handheld Nitendo DS", date: 2004)
let VGFact25 = HistoricalManager(event: "Nitendo releases the Nitendo Wii to get gamers off the couch and moving!", date: 2006)
let VGFact26 = HistoricalManager(event: "Rock Band is released and ready to rock and roll!", date: 2007)
let VGFact27 = HistoricalManager(event: "Angry Birds is released, and pulls millions of people who never even played video games before!", date: 2009)
let VGFact28 = HistoricalManager(event: "MineCraft, the addictive brick-building game is created", date: 2010)
let VGFact29 = HistoricalManager(event: "Mortal Kombat is released for console", date: 1992)
let VGFact30 = HistoricalManager(event: "Half-Life is released, a video game that made people skip school to play", date: 1998)
let VGFact31 = HistoricalManager(event: "PlayStation Portable (PSP) is released", date: 2005)
let VGFact32 = HistoricalManager(event: "Goldeneye 007 is released, a masterpeice game, is born", date: 1997)
let VGFact33 = HistoricalManager(event: "Metro Prime is released and sets fire on the video game market!", date: 2002)
let VGFact34 = HistoricalManager(event: "Little Big Planet is released for all gamers to play, create, and share what they build", date: 2008)
let VGFact35 = HistoricalManager(event: "The Elder Scrolls V: Skyrim is released", date: 2011)
let VGFact36 = HistoricalManager(event: "Flappy Bird is released, an addictive game that is just simple and fun", date: 2013)
let VGFact37 = HistoricalManager(event: "Nitendo releases the Wii U", date: 2012)
let VGFact38 = HistoricalManager(event: "The Oculus Rift releases, the vitrual reality headset!", date: 2016)
let VGFact39 = HistoricalManager(event: "Hearthstone: Heroes of WarCraft, a free-to-play online card game releases worldwide", date: 2014)
let VGFact40 = HistoricalManager(event: "Rocket League, an Indie video game is released", date: 2015)


let VideoGameList = [VGFact1, VGFact2, VGFact3, VGFact4, VGFact5, VGFact6, VGFact7, VGFact8, VGFact9, VGFact10, VGFact11, VGFact12, VGFact13, VGFact14, VGFact15, VGFact16, VGFact17, VGFact18, VGFact19, VGFact20, VGFact21, VGFact22, VGFact23, VGFact24, VGFact25, VGFact26, VGFact27, VGFact28, VGFact29, VGFact30, VGFact31, VGFact32, VGFact33, VGFact34, VGFact35, VGFact36, VGFact37, VGFact38, VGFact39, VGFact40]














