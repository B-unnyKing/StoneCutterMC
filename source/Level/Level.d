module Level.Level;

import std;

struct ClassicWorld {
    ushort w = 512;
    ushort h = 64;
    ushort d = 512;

    // Made private so external code cannot accidentally break the sync
    private ubyte[] _blocks;

    // 1. Updated constructor: Allocates the exact array size automatically
    this(ushort w, ushort h, ushort d) {
        this.w = w;
        this.h = h;
        this.d = d;
        // Automatically allocate memory initialized to 0 (Air)
        this._blocks = new ubyte[](cast(size_t)w * h * d);
    }

    // A getter properties to view the blocks if needed externally
    @property const(ubyte[]) blocks() const { return _blocks; }

    // Helper to calculate the 1D index from 3D coordinates safely
    private size_t getIndex(ushort x, ushort y, ushort z) const {
        return (cast(size_t)y * d + z) * w + x;
    }

    // 2. Set an individual block
    void setBlock(ushort x, ushort y, ushort z, ubyte blockId) {
        size_t idx = getIndex(x, y, z);
        if (idx < _blocks.length) {
            _blocks[idx] = blockId;
        }
    }

    // 3. Get an individual block
    ubyte getBlock(ushort x, ushort y, ushort z) const {
        size_t idx = getIndex(x, y, z);
        return (idx < _blocks.length) ? _blocks[idx] : 0;
    }

    // 4. Set a fast flat area (box) using internal row slicing
    void setFlatArea(ushort startX, ushort endX, ushort y, ushort startZ, ushort endZ, ubyte blockId) {
        import std.algorithm.mutation : fill;
        
        for (ushort z = startZ; z < endZ; z++) {
            size_t rowOffset = (cast(size_t)y * d + z) * w;
            _blocks[rowOffset + startX .. rowOffset + endX].fill(blockId);
        }
    }

    // 5. Fill an entire layer at once
    void setLayer(ushort y, ubyte blockId) {
        import std.algorithm.mutation : fill;
        size_t layerSize = cast(size_t)w * d;
        size_t start = layerSize * y;
        _blocks[start .. start + layerSize].fill(blockId);
    }

    ubyte[] serializeForSending() {
        auto rawData = appender!(ubyte[]);
        rawData.put(nativeToBigEndian!int(0x271bb)[]);
        rawData.put(nativeToBigEndian!ushort(w)[]);
        rawData.put(nativeToBigEndian!ushort(h)[]);
        rawData.put(nativeToBigEndian!ushort(d)[]);
        rawData.put(_blocks); // Serializes the hidden array

        return cast(ubyte[]) compress(rawData.data);
    }

    void saveToFile(string filename) {
        try {
            std.file.write(filename, serializeForSending);
            writeln("file created and saving");
        } catch (Exception e) {
            writeln("an error occurred when saving: ", e.msg);
        }
    }

    // ... loadFromFile code remains the same but assigns to `_blocks` ...
}
