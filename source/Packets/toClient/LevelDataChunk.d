module Packets.toClient.LevelDataChunk;

class LevelDataChunk {
    ubyte packetID = 0x03;
    short chunkLength;
    //Add level data type later
    ubyte percentComplete;
    
}