module Packets.toClient.ServerIdentification;

import std;

class ServerIdentification {
    ubyte packetID = 0x00;
    ubyte protocolVersion = 7;
    string serverName = "Armaan's Server!!";
    string serverMOTD = "Just a classic server!!";
    ubyte userType = 0x00; //0x00 equals the person is not op and cannot destroy bedrock while 0x64 means the user is an op and can destroy bedrock
    
}