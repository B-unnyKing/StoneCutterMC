module server;

import std;
import Packets.Packet;


void setupServerSocket() {
    ushort port = 25565;
    writeln("creating TCP socket...");
    auto server = new TcpSocket();
    server.blocking = false;
    writeln("binging to internet adress and new port");
    server.bind(new InternetAddress(port));
    writeln("bound successfully to internet adress and port!");
    writeln("server listening on port ", port);
    readln();
}

Packet readPacketFromClient(ubyte raw) {

}


void mainTickLoop() {

    while (true) {


        

    }

}