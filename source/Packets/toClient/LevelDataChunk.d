module Packets.toClient.LevelDataChunk;
import Packets.Packet;
import std;
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

    override ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        appendBigEndian(data, chunkLength);
        data.put(levelData[0 .. chunkLength]);
        data.put(percentComplete);
        return data.data;
    }
    
}