module Packets.toClient.UpPosAndOri;

class UpPosAndOri {
    ubyte packetID = 0x09;
    byte playerID;
    byte changeInX;
    byte changeInY;
    byte changeInZ;
    ubyte yaw = 0x02;
    ubyte pitch = 0x02;
}