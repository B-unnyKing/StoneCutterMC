module Tests;

import std;
import server;
import Level.Level;
import Generator.Flat;
import Blocks.BlockID;


void testWorld() {
    string nameOfSave = "testWorld";
    auto world = new ClassicWorld(512,64,512);
    setFlatTerrain("world");
    
    world.saveToFile(nameOfSave);

    readln();


}