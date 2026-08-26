module Packets.toClient.SpawnPlayer;

class SpawnPlayer {
    ubyte packetID = 0x07;
    byte playerID;
    string playerName;
    short x;
    short y;
    short z;
    ubyte yaw = 0x02;
    ubyte pitch = 0x02;
}