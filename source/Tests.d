module Tests;

import std;
import server;
import Level.Level;

import Blocks.BlockID;


void testWorld() {
    string nameOfSave = "testWorld";
    auto world = new ClassicWorld(512,64,512);
    world.setLayer(1, stone);

    world.saveToFile(nameOfSave);

    readln();

    
}