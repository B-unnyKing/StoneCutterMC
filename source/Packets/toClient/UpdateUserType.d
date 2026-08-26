module Packets.toClient.UpdateUserType;

class UpdateUserType {
    ubyte packetID = 0x0f;
    ubyte userType; // can either be 100 which allows breaking bedrock or 0 which mean they can't
}