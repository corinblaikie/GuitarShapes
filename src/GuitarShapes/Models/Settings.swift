//
//  Settings.swift
//  GuitarShapes
//
//  Created by Corin Blaikie on 20/08/2015.
//  Copyright (c) 2015 Corin Blaikie. All rights reserved.
//

import Foundation

class Settings {
    
    static let instance = Settings()

    private var stringsEnabled:[Bool] = [Bool](count:6, repeatedValue: true)
    private var fretsEnabled:[Int] = [-1,0,1,2,3,4,5,6,7,8,9,10,11,12]
    
    private var onlyMarkerFrets:Bool = false
    
    private var minFret:Int = 0
    private var maxFret:Int = 12
    private var markerFretIndexes = [2, 4, 6, 8, 11, 14, 16, 18, 19]
    
    func getMarkerFrets() -> Bool {
        return onlyMarkerFrets
    }
    
    func getMinFret() -> Int {
        return minFret;
    }
    
    func getMaxFret() -> Int {
        return maxFret;
    }
    
    func setMinFret(value:Int) {
        minFret = value
        updateFrets()
    }
    
    func setMaxFret(value:Int) {
        maxFret = value
        updateFrets()
    }
    
    func isStringEnabled(guitarString:GuitarString) -> Bool {
        return stringsEnabled[guitarString.index]
    }
    
    private func updateFrets() {
        self.fretsEnabled = []
        
        for index in -1...11 {
            if ((index >= minFret) && (index <= maxFret) && !restrictedByOnlyMarkerFrets(index)) {
                fretsEnabled.append(index)
            }
        }
    }
    
    private func restrictedByOnlyMarkerFrets(fretIndex:Int) -> Bool {
        
        return onlyMarkerFrets && !markerFretIndexes.contains(fretIndex)
    }

    
    private init() {
        
    }
    
    func toggleString(guitarString:GuitarString, enabled:Bool) {
        stringsEnabled[guitarString.index] = enabled
        updateFrets()
    }
    
    func toggleMarkerFrets(value:Bool) {
        onlyMarkerFrets = value
        updateFrets()
    }
    
    func isEnabled(stringIndex:Int, fretIndex:Int) -> Bool {
        return stringsEnabled[stringIndex] && fretsEnabled.contains(fretIndex)
    }
}