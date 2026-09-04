module SaveHelper;

import std;
import Blocks.BlockID;
import Level.Level;
import server;



class SaveHelperClass {

    void checkForWorld() {

        string worldFilePath;

        if (exists(worldFilePath)) {

            writeln("world file exists. Use filepath:", worldFilePath);
        } else {

            auto testWorld = new ClassicWorld(512,64,512);
            testWorld.setLayer(1, stone);
            testWorld.saveToFile(worldFilePath);
        }
    }
}