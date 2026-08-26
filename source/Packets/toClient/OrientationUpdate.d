module Packets.toClient.OrientationUpdate;

class OrientationUpdate {
    ubyte packetID = 0x0b;
    byte playerID;
    byte yaw = 0x02;
    byte pitch = 0x02;
}