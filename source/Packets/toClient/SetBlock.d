module Packets.toClient.SetBlock;

class SetBlock {
    ubyte packetID = 0x06;
    short x;
    short y;
    short z;
}