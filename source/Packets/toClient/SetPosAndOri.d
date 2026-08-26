module Packets.toClient.SetPosAndOri;

class SetPosAndOri {
    ubyte packetID = 0x08;
    byte playerID;
    short x;
    short y;
    short z;
    ubyte yaw = 0x02;
    ubyte pitch = 0x02;

}