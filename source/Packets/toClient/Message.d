module Packets.toClient.Message;

class Message {
    ubyte packetID = 0x0d;
    byte playerID;
    string message;
}