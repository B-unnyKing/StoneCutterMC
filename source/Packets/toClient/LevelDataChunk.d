module Packets.toClient.LevelDataChunk;
import Packets.Packet;
class LevelDataChunk : Packet {
    immutable ubyte packetID = 0x03;
    short chunkLength;
    ubyte[1024] levelData;
    ubyte percentComplete;

    this(short chunkLength, ubyte[1024] levelData, ubyte percentComplete) {

        this.chunkLength = chunkLength;
        this.levelData = levelData;
        this.percentComplete = percentComplete;

    }
    
}