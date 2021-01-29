pragma abicoder               v2;


contract C {
    bytes data;
    struct S {
        uint256 a;
        uint256[] b;
    }

    function f() public returns (S memory) {
        S memory s;
        s.a = 8;
        s.b = new uint256[](3);
        s.b[0] = 9;
        s.b[1] = 10;
        s.b[2] = 11;
        data = abi.encode(s);
        return abi.decode(data, (S));
    }
}

// ====
// compileViaYul: also
// ----
// f() -> 0x20, 0x8, 0x40, 0x3, 0x9, 0xa, 0xb
// gas ir: 199675
// gas legacy: 196426
// gas legacyOptimized: 193470
// gas irOptimized: 194189
