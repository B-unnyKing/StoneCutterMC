module Packets.toClient.LevelDataChunk;
import Packets.Packet;
class LevelDataChunk : Packet {
    immutable ubyte packetID = 0x03;
    short chunkLength;
    //Add level data type later
    ubyte percentComplete;
    
}