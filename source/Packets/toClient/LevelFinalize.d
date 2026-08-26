module Packets.toClient.LevelFinalize;

class LevelFinalize {
    ubyte packetID = 0x04;
    short xSize;
    short ySize;
    short zSize;
}