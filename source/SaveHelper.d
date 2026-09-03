module SaveHelper;

import std;
import Blocks.BlockID;
import Level.Level;
import server;

void CheckForWorld() {

    __gshared string filepath = "world";

    if (exists(filepath)) {

        writeln("world file exists. Use filepath:", filepath);
    } else {

        auto testWorld = new ClassicWorld(512,64,512);
        testWorld.setLayer(1, stone);
        testWorld.saveToFile(filepath);
    }

}